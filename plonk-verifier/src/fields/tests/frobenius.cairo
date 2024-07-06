use plonk_verifier::traits::{FieldOps, FieldUtils};
use plonk_verifier::fields::{fq12, Fq12, Fq6, fq6, Fq12Ops};
use plonk_verifier::fields::fq_generics::{TFqAdd, TFqSub, TFqMul, TFqDiv, TFqNeg, TFqPartialEq,};
use plonk_verifier::fields::print::{FqPrintImpl, Fq2PrintImpl, Fq6PrintImpl, Fq12PrintImpl};
use debug::PrintTrait;

fn frobenius_fq12() -> Array<Fq12> {
    array![
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x1c8ab87de856aafdfb56d051cd79517ae10b4490cc01bd75b347a669d58698da,
            0x2e7918e3f3702ec1f031bcd571b3c23730ab030a0e7a875c6f99f4536ab3f0bb,
            0x21f3d1e320a26684b45a7f73a82bbcdabcee7b6b7f1b1073985de6d4f3867bcd,
            0x2cbf9b28de156b9f479d3a97a216b566d98f9b976f25a5ca31fbab41d9de224d,
            0x2da44e38ec26bde1ad31495943114856dd885beb7889c590079bb300bb6ec023,
            0x1c40f4619c21dbd91ba610a8943188e35402e587a071361f60288e7e96fa33b,
            0x9ebfb41a99f28109afed1112aab3c8ab4ff6dd90097e880669c960f11106b52,
            0x2d0c275838257edb77665b9aafbbd40626b6a35fe12b4ccacee5613bf3408fc2,
            0x289d6d934bc5994e10f4dc4bfe3a5ac9cddfce66ee76df1e751b064bfdb5533d,
            0x1e18e64906693e6f4c9cd40273060c504a78843d903489abb13377666679d33f,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x1cabed05fed3aa195ad70ac2686db2e28ccf48dfd49d4985538e87354314bc28,
            0x210fee6a80e0af180d53ba3486b1e290a7ca6eaf838db44cef69521387db92ac,
            0x10d14b7f2127f81e89c4678c5c100f7a1cbaf9bb8835e4f5927d9f66da9114d7,
            0x1fb725796926535e7d527be5ec4e49984322d769d3167011eacf38fa9f5ec4d9,
            0xacf5ceac1dc780786ad2177908c734283d52498371c3b5aa661a5ae4e06afa5,
            0x118cf24be0f6571d2b5a834143435f3ccb0e17f01218cea61f3f41c9fd3a54a9,
            0xf4daafb717af193454617ea66f0dd8a36d5cb7cf704530f4327ac4eb369cfe5,
            0x537929a89d7c274be0a4665355726071a3efd5a7f9a2ebec75902e39868bdec,
            0x1a1a45294d7ffee8485e249d409373b941f120fbeac33bdee24f8aedcbd2e9e2,
            0xc01a7aeb72452da867b00a61eaf175e59b1febc687a99e5127f7085514e7492,
            0x18e1e1c3c30021f6c16383318a0c2c198f0a3b39647c89743659158f73841704,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x11d39d54c80149a00e50510c0c8d6d2777d22a42646147233d6dd55c97095f88,
            0x1ffabaa3134fd66d2f1c13c6181e6e5af5280422a7f530f8b3e70009822a1d46,
            0x1fb0e8c9138700bb8e4573760403b67a1422520c17b57ba0c88ca553a99567f0,
            0x1ad2d38a612cc3689924050a65f40795dbf40f1a59dc9877c37fb1393d3cd7eb,
            0x2b292a1be09a58191905677ac92707867784beb9c4c66d36c13ecec89d174f0c,
            0x4c033e9b233f579e384c6f13455ad6372230969dc40af64039cdd1eca619931,
            0x26785331379278191d5174a556d61bd2e281fcb867d9e20cd583f607c76c91f5,
            0x358271aa90c214e40e9ea1bd1c5845770cac73187467dc26d3b2adae53c6d85,
            0x155bf1e813f4b46eb9bca31ccc0601b25bdd4f330c76e7af566b15ae4487b8c2,
            0x21cecc3195e9b2eb591861cdd8cfcdc95084aa0c1b2d6cd13a9620c0f75a0c71,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x1cabed05fed3aa195ad70ac2686db2e28ccf48dfd49d4985538e87354314bc28,
            0x2837dd09e96e2897c38c077a17c1d01450dd2ebeec19975c6f23996f75073bd6,
            0x24224696af9fc4be9f1bfad7f38786c8b274e1a16351fc3dbfeb6ac28407ac3b,
            0xf5a0a5f1035845a78d2378be8d88219b7af94c0ef6f74924ab5f530cdd78315,
            0x1123ab77b1e15935a31a9f3a4b7dd9484778d90af23d4a913cb65dae8973ebcb,
            0x112b88d04f11a378fbc0a124b2b8786d20457b291a13c1ab215bde5b08adfd88,
            0x23a25b36b77e228eedc0fb9a914ff02406611919afd84ed1ffd4456a90a791c0,
            0x2b2cbbd85759ddb4fa45ff514c2a32567d426d36e8d79bce74c7893340143f5b,
            0x164a094993b1a1416ff2211940ede4a4559049957dae8eae59d101290caa1365,
            0xd44e1f2a138224f0319e5d6dc076a919b1bf96a3b063e17a8de3a699bc9d24b,
            0x48379adf9a4e4c83bbf3b375ed092821892623cedd0f3caa3edb06bf5583dc2,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x205f8a030d9ab8baea92458a77a99bb3ea3fbbe380ec5f44b6b10506bed04e5,
            0x1254c95ebba33b245152bad179308029092fcdf61a73dcc554c023d0c41bec8d,
            0x1f23e2398e39d9132e00988356d33d665df207ab3a13090617568c0513de16d1,
            0x19362e328321114b8fdf4bcafaf7f3be797f2a7107e156d882c5bbb299df0056,
            0x2de92a55d5a53a61242463d80797178d317dcd5fb4ae7233f5c3a7deba258c30,
            0x2fc24a39871d7bc51ca65e6ab1294d53ce2db1162399c020d9a5436e0f1f5f6,
            0x9ebfb41a99f28109afed1112aab3c8ab4ff6dd90097e880669c960f11106b52,
            0x2d0c275838257edb77665b9aafbbd40626b6a35fe12b4ccacee5613bf3408fc2,
            0x1d22d2c7a960bb4a61180c874f4cff46257eeb5d8671d31e1d709b791f4f62cc,
            0x3b5e5e88f80747c0c7b8dcb65c9c179060c25ce8af8e3258962a95a90e03932,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x1cabed05fed3aa195ad70ac2686db2e28ccf48dfd49d4985538e87354314bc28,
            0x1780d171581468a39fc0c9be648efe16365b37b4613c497119b42caab4172c0c,
            0x2bd50acff19b837647c02908b36b1a785fd2f9c5e55bb3e725d80e045261397c,
            0x1531e9a67d5c870c22b9244ac5a8cab9caefe66a5ebe5e9069b5deb6b46b559,
            0x147146106d73ceec8e888504a5770bd2cc336cee3f1844a1590888ba010261d7,
            0x3002e4f74f4cec8588b66399f0f6718decb8cdca706cbd923e3d28a7e3f0a626,
            0x1454b03b460330fba87ae3b02a5f1299cf8b4d9cb8d3fbc2bcac991bdd3dc1db,
            0x537929a89d7c274be0a4665355726071a3efd5a7f9a2ebec75902e39868bdec,
            0x1a1a45294d7ffee8485e249d409373b941f120fbeac33bdee24f8aedcbd2e9e2,
            0x1433a43ea13cf747c9ee530bd5853334169faadd28ba432965ec9e44a7b5db9,
            0x1c05e65d17d662fb32abfdbc5645bec621099194f1c634e3a9b526f35a512405,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x1c8ab87de856aafdfb56d051cd79517ae10b4490cc01bd75b347a669d58698da,
            0x2e7918e3f3702ec1f031bcd571b3c23730ab030a0e7a875c6f99f4536ab3f0bb,
            0x21f3d1e320a26684b45a7f73a82bbcdabcee7b6b7f1b1073985de6d4f3867bcd,
            0x2cbf9b28de156b9f479d3a97a216b566d98f9b976f25a5ca31fbab41d9de224d,
            0x2c00039f50ae2480b1efc5d3e701006b9f90ea5efe804fd3484d9161d0e3d24,
            0x2ea03f2cc76f826c2695e4abf83e3fcf62413c38ee6ab72b461e032eef0d5a0c,
            0x26785331379278191d5174a556d61bd2e281fcb867d9e20cd583f607c76c91f5,
            0x358271aa90c214e40e9ea1bd1c5845770cac73187467dc26d3b2adae53c6d85,
            0x7c6e0df956c06dba75b696a8346fd93c9a19c2a79faeb6ec70585cadac7aa0a,
            0x124b6829dac861ba6bb371b40e7b4c0d4d08e653d83d40e18aed14b072032a08,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x1cabed05fed3aa195ad70ac2686db2e28ccf48dfd49d4985538e87354314bc28,
            0x210fee6a80e0af180d53ba3486b1e290a7ca6eaf838db44cef69521387db92ac,
            0x10d14b7f2127f81e89c4678c5c100f7a1cbaf9bb8835e4f5927d9f66da9114d7,
            0x1fb725796926535e7d527be5ec4e49984322d769d3167011eacf38fa9f5ec4d9,
            0xacf5ceac1dc780786ad2177908c734283d52498371c3b5aa661a5ae4e06afa5,
            0x1ed75c27003b490c8cf5c2753e3df920cc7352a15658fbe71ce14a4cdb42a89e,
            0x2116a3776fb6ae96730a2dcc1a907ad360ab9f14716d777df8f8dfc825132d62,
            0x2b2cbbd85759ddb4fa45ff514c2a32567d426d36e8d79bce74c7893340143f5b,
            0x164a094993b1a1416ff2211940ede4a4559049957dae8eae59d101290caa1365,
            0x2462a6c42a0d4d4f31d5451062d240ff3dcf6bd4fff730a829a11b91872e88b5,
            0x17826caf1e317e32f6ecc284f7752c4408772f5803f5411905c7768764f8e643,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x11d39d54c80149a00e50510c0c8d6d2777d22a42646147233d6dd55c97095f88,
            0x1ffabaa3134fd66d2f1c13c6181e6e5af5280422a7f530f8b3e70009822a1d46,
            0x1fb0e8c9138700bb8e4573760403b67a1422520c17b57ba0c88ca553a99567f0,
            0x1ad2d38a612cc3689924050a65f40795dbf40f1a59dc9877c37fb1393d3cd7eb,
            0x53b2457009748109f4ade3bb85a50d71ffcabd7a3ab5d567ae1bd4e3b65ae3b,
            0x2ba41a892efdaaafd4cb7ec54d2baafa255e61278c311b293883aef80e1b6416,
            0x9ebfb41a99f28109afed1112aab3c8ab4ff6dd90097e880669c960f11106b52,
            0x2d0c275838257edb77665b9aafbbd40626b6a35fe12b4ccacee5613bf3408fc2,
            0x1b085c8acd3cebbafe93a299b57b56ab3ba41b5e5bfae2dde5b5766893f54485,
            0xe9582414b47ed3e5f37e3e8a8b18a9446fcc0854d445dbc018a6b55e122f0d6,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x1cabed05fed3aa195ad70ac2686db2e28ccf48dfd49d4985538e87354314bc28,
            0x2837dd09e96e2897c38c077a17c1d01450dd2ebeec19975c6f23996f75073bd6,
            0x24224696af9fc4be9f1bfad7f38786c8b274e1a16351fc3dbfeb6ac28407ac3b,
            0xf5a0a5f1035845a78d2378be8d88219b7af94c0ef6f74924ab5f530cdd78315,
            0x1123ab77b1e15935a31a9f3a4b7dd9484778d90af23d4a913cb65dae8973ebcb,
            0x1f38c5a2921ffcb0bc8fa491cec8dff0773bef684e5e08e21ac4adbbcfceffbf,
            0xcc1f33c29b37d9aca8f4a1bf031683991205177b8997bbb3c4c46ac47d56b87,
            0x537929a89d7c274be0a4665355726071a3efd5a7f9a2ebec75902e39868bdec,
            0x1a1a45294d7ffee8485e249d409373b941f120fbeac33bdee24f8aedcbd2e9e2,
            0x231f6c803ff97ddab5365fdfa579edcbfc6571272d6b8c75934251ad3cb32afc,
            0x2be0d4c4e78cbb617c910a7f22b0c5db7eef08547aa0d6c29832dbaae324bf85,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x205f8a030d9ab8baea92458a77a99bb3ea3fbbe380ec5f44b6b10506bed04e5,
            0x1254c95ebba33b245152bad179308029092fcdf61a73dcc554c023d0c41bec8d,
            0x1f23e2398e39d9132e00988356d33d665df207ab3a13090617568c0513de16d1,
            0x19362e328321114b8fdf4bcafaf7f3be797f2a7107e156d882c5bbb299df0056,
            0x27b241d0b8c65c8942be1de79ea40d066039d31b3c35859465ce4381e577117,
            0x2d6829cf48bfc86d6685dfcfd66ec3885a9e8f8006382e8b2e8637dff78b0751,
            0x26785331379278191d5174a556d61bd2e281fcb867d9e20cd583f607c76c91f5,
            0x358271aa90c214e40e9ea1bd1c5845770cac73187467dc26d3b2adae53c6d85,
            0x13417bab37d0e4df5738392f3234591772027f33e1fff76f1eaff09db92d9a7b,
            0x2cae688a51b12badabd4b7eb1bb796e4917544c2dd78e767b2bde2bc479cc415,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x1cabed05fed3aa195ad70ac2686db2e28ccf48dfd49d4985538e87354314bc28,
            0x1780d171581468a39fc0c9be648efe16365b37b4613c497119b42caab4172c0c,
            0x2bd50acff19b837647c02908b36b1a785fd2f9c5e55bb3e725d80e045261397c,
            0x1531e9a67d5c870c22b9244ac5a8cab9caefe66a5ebe5e9069b5deb6b46b559,
            0x147146106d73ceec8e888504a5770bd2cc336cee3f1844a1590888ba010261d7,
            0x61697b91e4b3a42f99e21c908ae6cfaac89cc6f8050cfafde3636ef48c5721,
            0x1c0f9e379b2e6f2e0fd56206572245c3c7f61cf4af9dceca7f73f2fafb3f3b6c,
            0x2b2cbbd85759ddb4fa45ff514c2a32567d426d36e8d79bce74c7893340143f5b,
            0x164a094993b1a1416ff2211940ede4a4559049957dae8eae59d101290caa1365,
            0x2f21142ef71dd0b53bb16085c429052a56176fe395e6265aa5c1c2328e019f8e,
            0x145e6815c95b3d2e85a447fa2b3b99977677d8fc76ab95a9926b65237e2bd942,
        ),
        fq12(
            0x1da92e958487e1515456e89aa06f4b08040231ec5492a3873c0e5a51743b93ae,
            0x13b8616ce25df6105d793af41913a57b0ab221b193d48107e89204e19568411f,
            0x1c8ab87de856aafdfb56d051cd79517ae10b4490cc01bd75b347a669d58698da,
            0x2e7918e3f3702ec1f031bcd571b3c23730ab030a0e7a875c6f99f4536ab3f0bb,
            0x21f3d1e320a26684b45a7f73a82bbcdabcee7b6b7f1b1073985de6d4f3867bcd,
            0x2cbf9b28de156b9f479d3a97a216b566d98f9b976f25a5ca31fbab41d9de224d,
            0x2da44e38ec26bde1ad31495943114856dd885beb7889c590079bb300bb6ec023,
            0x1c40f4619c21dbd91ba610a8943188e35402e587a071361f60288e7e96fa33b,
            0x9ebfb41a99f28109afed1112aab3c8ab4ff6dd90097e880669c960f11106b52,
            0x2d0c275838257edb77665b9aafbbd40626b6a35fe12b4ccacee5613bf3408fc2,
            0x289d6d934bc5994e10f4dc4bfe3a5ac9cddfce66ee76df1e751b064bfdb5533d,
            0x1e18e64906693e6f4c9cd40273060c504a78843d903489abb13377666679d33f,
        )
    ]
}

#[test]
#[available_gas(50000000)]
fn fq12_frobenius_all() {
    let frobenius_maps = frobenius_fq12();
    let input = *frobenius_maps[0];
    let mut i = 0;
    loop {
        i += 1;
        if i == frobenius_maps.len() {
            break;
        }
        assert(input.frobenius_map(i) == *frobenius_maps[i], 'incorrect frobenius 0' + i.into())
    }
}

