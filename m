Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB01210980
	for <lists+linux-omap@lfdr.de>; Wed,  1 Jul 2020 12:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgGAKhM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Jul 2020 06:37:12 -0400
Received: from sonic302-20.consmr.mail.ir2.yahoo.com ([87.248.110.83]:33934
        "EHLO sonic302-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729791AbgGAKhL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Jul 2020 06:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1593599829; bh=+NKq2YP/4c3bLm2HmGhxa/KCZOXr0NIUKHs/ECuC0yk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=QlKecTcksqi1fAN77ueNBL2ZZsJz/wkaEQc4hQJLmrlSDO76j0j9De30gewiz1KsBzRnpeN16ef1cj6PAlwysf58aXW4UxZrBQDHs1o+uu59eRyM6n2ITjzCacxVonXZvxOccQVdP2y250bqM8o+VY8PpH3i6x6twYAW5u6kjhp86Y3jrluLAMHu4NVIyfg6T0C74Z7g7hWGEvqzGhm4SB95ty9rCGpj2q9NqDBgvxXwwj2X/Lu2oWnFobeL1NqTkcm5lx7Hqq8mnfZfrBiElU3exf8MEoX2fH2CdzG9s+fSn4Yw/kK/25EQM06MXOuk4N/d5ln51Fhpcv8HFWe4lw==
X-YMail-OSG: MKPKtp0VM1k5aiNga9IgWulxlHtW86jFK0effeVdHF_zRPvyqcHpZKfMhwpesaE
 Hc42QqGzciokzohw_0lT8RQuQb2tAUmDhqXqyU3yFqnpc6a1f3BLie8aL2S9kL341pqTCMtuzsQ2
 epMpHWC9ZmUOC55YQloT9sqPrvuH2q48JUJWFqy5MFX2.y3hnE5UCcrePcj.c6lUqbuYvFKlrTvK
 n30mfT_cA4rtEwcfoNEyMw7QJ_9LXQGxqhc.6q3iJD898aqB2f_SWvdeNelhL.SUXM3FI32cRgMJ
 6KIg1LKtmQ4XcyQWVEBFsF9eseIcdJicVDjB1bjOZD.rUHfbDR8V3IrtVIGqKmXGLW6_QOEQzT29
 T.X3FDGRp6pt5Zfi.S7qxrlH8qj02bUhOqSM2qT9LbCozmS4o3OSInD1MBpmTx.TpjktCHkCDmX3
 ZC16LYNc1B0Sa7YzqXcWKs5rMKOQagWe6kk9xjEjQ2wRQeYBRmNLDO8btlH0Sz1qwh1Xz8uYOp6n
 IBkOPfduU8_tuoe0U1rg5wdohW0Li89iMreSyBo2Ks6t5uXG6LGEST3hfekA9URB7LmUrnVWX8Xo
 esrvm5JnCTJaH4Ah.d0u1AopEjUo_Rt1vQVsf2FnWDBem5agoJI3ULret6Xywm3u7ws3UDluzTeI
 58My1SGFDLDrCoaMqlwxbnzx8Mx5KFiopxAB01SSTXj2bOq8D851kndO9miClGr7Xmhk.vlgeXjM
 zTSIz8qJHxrh0rtkYiJ9iTzpSHELTwWlmS1aixzKyprFXYu5PfQwvut_1SFYJFUJy3RBdWS27CxL
 hwcjDCrHDnRRFpdJ_c6KKbX1BfBSNnNf2QX0L4x12NfDe0ny_D9kdgrydWUiznLzDwp14zwuabXW
 G9pXmOXLyHIXxOaSXI0DEzIh.Lr8v6T4OQxNrui3zHIJsZI_cyi6hBB.EyKtpz4u8dFaH_6.yKSF
 7SQqm1yUOlYS7fFZO90d9FQDqDfxmsV9Eetiht.os2v42TAYv1wEpTimG5k2jGvxMNuWxCyUB_zy
 iFlKVHFXQBRYi5JZYh9lmgOOgx98qDnRKjGgTJ6G2UV.u_MH3oZ1WYdVqF4ObYCRX7t4Mqp0UKw6
 9reiArRWkc7vfNU2DbVGPaS1Py8UU8hBVpEZnIW.57Qmj7ZHolKhU3qFf1q_6s7mm9tLtvObS0u_
 WeWUQpcPvkUJu8mRYRpfHkXKzaL1UiQ4z40uyZ8feWHA9zjQx0XLz2UQeu_3Pw1qyni5LN7iTAr2
 YEZKUD8qRUrObTYJL1Idisf7WJo56XWe0lvCRu1OPjd1vXIpcJODhk80rooDo9sdRebW63FWccch
 JWcwwyzHe
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 1 Jul 2020 10:37:09 +0000
Date:   Wed, 1 Jul 2020 10:37:05 +0000 (UTC)
From:   "Mrs. Mina A. Brunel" <mrs.minaabrunel209@gmail.com>
Reply-To: mrsminaaaliyahbrunel344@gmail.com
Message-ID: <1488208883.1427323.1593599825535@mail.yahoo.com>
Subject: My Dear in the lord
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1488208883.1427323.1593599825535.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16197 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:77.0) Gecko/20100101 Firefox/77.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



My Dear in the lord


My name is Mrs. Mina A. Brunel I am a Norway Citizen who is living in Burki=
na Faso, I am married to Mr. Brunel Patrice, a politician who owns a small =
gold company in Burkina Faso; He died of Leprosy and Radesyge, in the year =
February 2010, During his lifetime he deposited the sum of =E2=82=AC 8.5 Mi=
llion Euro) Eight million, Five hundred thousand Euros in a bank in Ouagado=
ugou the capital city of Burkina Faso in West Africa. The money was from th=
e sale of his company and death benefits payment and entitlements of my dec=
eased husband by his company.

I am sending you this message with heavy tears in my eyes and great sorrow =
in my heart, and also praying that it will reach you in good health because=
 I am not in good health, I sleep every night without knowing if I may be a=
live to see the next day. I am suffering from long time cancer and presentl=
y I am partially suffering from Leprosy, which has become difficult for me =
to move around. I was married to my late husband for more than 6 years with=
out having a child and my doctor confided that I have less chance to live, =
having to know when the cup of death will come, I decided to contact you to=
 claim the fund since I don't have any relation I grew up from an orphanage=
 home.

I have decided to donate this money for the support of helping Motherless b=
abies/Less privileged/Widows and churches also to build the house of God be=
cause I am dying and diagnosed with cancer for about 3 years ago. I have de=
cided to donate from what I have inherited from my late husband to you for =
the good work of Almighty God; I will be going in for an operation surgery =
soon.

Now I want you to stand as my next of kin to claim the funds for charity pu=
rposes. Because of this money remains unclaimed after my death, the bank ex=
ecutives or the government will take the money as unclaimed fund and maybe =
use it for selfishness and worthless ventures, I need a very honest person =
who can claim this money and use it for Charity works, for orphanages, wido=
ws and also build schools and churches for less privilege that will be name=
d after my late husband and my name.

I need your urgent answer to know if you will be able to execute this proje=
ct, and I will give you more information on how the fund will be transferre=
d to your bank account or online banking.

Thanks
Mrs. Mina A. Brunel
