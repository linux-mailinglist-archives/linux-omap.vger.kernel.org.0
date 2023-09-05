Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0E1792459
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjIEP6s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354861AbjIEPKA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 11:10:00 -0400
X-Greylist: delayed 8363 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 05 Sep 2023 08:09:56 PDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43A5191
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 08:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693926586; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Czk3puIyMbDuAmh4QTFmoxCpCgvPXlamNlJIgJ5ZU8MwKuZGnOvM6soeUcimwyilAI
    PuaZFJb1G4Ax48mVlYLb1oJ1hkzK9Eocwy06Ldv5L+p/4sYgdGDySwJE7f+KZtyDsa14
    q4m8ZewthkE4A2js7ZaS/xsfR3haLQKo/pjHYcbe8sSrx3Dls95fbcJ3A/ZMTf3vkvSD
    lfrE15jGZadysMc+7MtlTP+94IkddRLKRAtHDWJLIJNmbAwnjHJkPa/Jg9XUEtzuaDkF
    ftKHgomp4BfS5Sq8fpbIkQauj3bwjulch4//xfQU++bh4Vjs4id8EcWYtPKPKI1x5DdW
    aggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693926586;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=XSR43gKFt6a6lafF2CmyoSX0p8opGKVr+9zTmDzjyYk=;
    b=gAi19phMDPkDJdfWGDTwwPE+cQIyrkOUKK3VBLe5A6dDTYSvDytEC8u3tT8z+JO2Xy
    /OZGErRVkYf7hIlngCMyO9g/NcqIYO8HKXnRlXfYjNEuludo15ZDZ9v7+SU4gBzEktJk
    W4KZ0nWZWZsi5cT2QeU9N4QglVLlLmWQntZ/eXNRkaXicdqrWzFMVxBbk94IsKe64x0F
    wAIfEiooCkBi/LKS7DhOY5D6KjBoyftUAhjPbnOnwhV9HIVPf7SPsEwtiboDGC2h7mFJ
    JDEP1iD/NMnM5bQqu9lgZcgw6PiLBZ3jBjhi5DhlxBh6EXkxUVXbOs1e4g2wM8HTtUOH
    KMrQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693926586;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=XSR43gKFt6a6lafF2CmyoSX0p8opGKVr+9zTmDzjyYk=;
    b=XX0mvLbqUCetCouamCQlnNsAz6WUgCrJbuujjEqeaCaw+EYxPJnRTq6nGEagG53Aef
    X9gTsIkj3YHLcDyZXpNGr/MzGS4NewlqpKJjN40lJhTsLRl+In97FjdqgVT6v9G/I2oz
    DNMA0A2fRsBTIkaOE3J/9+OjspCldTlTYYj+B47bqq3iJT05pn89hwc0+jD8XmA9X42f
    D/rLOTJKr/Vgv/Dcy+OPxBRC1K7s8PNEHJeXhWiHagBpH1KeUGQJB67uivTdjx1GDVN0
    k06M3vm/x+aWoYaQmOG2YnUlblbLr1ZpGQSnEhP/9DvhuV9gxkSYK4WDj1612mTRsHcW
    BbjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693926586;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=XSR43gKFt6a6lafF2CmyoSX0p8opGKVr+9zTmDzjyYk=;
    b=XatNQomRlVRDEuDDrHhky3654xZpJYdd36kBwNNdRC3X/W/U2S6RlnuTKRB3dbyQ8P
    Gmf45qsV3n8SxDVADxDw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZizY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85F9kMT4
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 17:09:46 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20230905164453.3be3f33a@aktux>
Date:   Tue, 5 Sep 2023 17:09:45 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Patrik_Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6C48500-26FD-4F2C-9521-C739B57C9576@goldelico.com>
References: <45F44D32-E846-4A53-BA20-9C78CD4411F3@goldelico.com>
 <ZO4SWw/rbJH5Dpbq@dalakolonin.se>
 <A029FB33-9FBB-4CE5-92D5-597E10B3A032@goldelico.com>
 <ZPH5Yr3w7ruN/io0@dalakolonin.se>
 <05B47ED4-CA2C-4754-ABB1-0591E9018E57@goldelico.com>
 <ZPLYG16mwiwt9G9R@dalakolonin.se>
 <CB775A6F-FDB6-4639-B386-8E8BEE4CD88C@goldelico.com>
 <20230902122635.2482b0cf@aktux> <20230904063432.GV11676@atomide.com>
 <03375B42-C86E-4B37-98C2-C1FBA7AB68B6@goldelico.com>
 <20230905061208.GW11676@atomide.com>
 <9CF135C5-85B6-47CC-985C-FE6F4B24407D@goldelico.com>
 <20230905164453.3be3f33a@aktux>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 05.09.2023 um 16:44 schrieb Andreas Kemnade <andreas@kemnade.info>:
>=20
> On Tue, 5 Sep 2023 14:42:03 +0200
> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>=20
>> Hi Tony,
>>=20
>>> Am 05.09.2023 um 08:12 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> The key observation is that the abe_iclk references in the DTS seem =
to be nowhere referenced =20
>>>> (which may or may not be an issue):
>>>>=20
>>>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap44xx-clocks.dtsi#L509
>>>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap54xx-clocks.dtsi#L161 =20
>>>=20
>>> So I guess the ick is in the dts the ocp_abe_iclk@528 for omap4 and
>>> abe_iclk@528 for omap5. Seems like the driver should request them, I =
recall
>>> that the interconnect target module does not need the ick to access =
sysc
>>> and revision registers. =20
>>=20
>> Yes, that is what I suspect but I don't know how to request them.
>>=20
> add ,"ick" to the clock-names line in the target-module?
> and ,<&ocp_abe_iclk> to the target module?

You mean

diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi =
b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
index 7ca7b369b4e59..aa140a8bb9f29 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
@@ -482,8 +482,8 @@ target-module@f1000 {                       /* =
0x401f1000, ap 32 20.0 */
                                        <SYSC_IDLE_NO>,
                                        <SYSC_IDLE_SMART>;
                        /* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm =
*/
-                       clocks =3D <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>;
-                       clock-names =3D "fck";
+                       clocks =3D <&abe_clkctrl OMAP4_AESS_CLKCTRL 0>, =
<&ocp_abe_iclk>;
+                       clock-names =3D "fck", "ick";
                        #address-cells =3D <1>;
                        #size-cells =3D <1>;
=20
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi =
b/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
index 611c92e04fe7a..647f34e38c431 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4-abe.dtsi
@@ -421,8 +421,8 @@ target-module@f1000 {                       /* =
0x401f1000, ap 32 20.0 */
                                        <SYSC_IDLE_NO>,
                                        <SYSC_IDLE_SMART>;
                        /* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm =
*/
-                       clocks =3D <&abe_clkctrl OMAP5_AESS_CLKCTRL 0>;
-                       clock-names =3D "fck";
+                       clocks =3D <&abe_clkctrl OMAP5_AESS_CLKCTRL 0>, =
<&abe_iclk>;
+                       clock-names =3D "fck", "ick";
                        #address-cells =3D <1>;
                        #size-cells =3D <1>;
=20

Well, certainly worth trying!

BR,
Nikolaus=
