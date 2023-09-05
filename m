Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4872D792C7F
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 19:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232785AbjIERc1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 13:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238901AbjIERbz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 13:31:55 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901817A9B
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 09:58:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693932829; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BZvwDmZFTnW+rbOTcrFAykMugSuGHeMIUJBi8RjzYf2WkFRaWx5xTnEzZHJFhOfgt8
    Mc5SObcsjU9+JOhKeWSQa8ynMPrNWdW0e3WBi0dBpCWNmCQSynqSuxT88//+/ItG97Jv
    cHuwS1//LjiIk8QK/8mRE7ctQOqZ+Mg5e/5EjZkh6eBPeShbhitL7OBiRHzXn8F7AGzM
    7SFNqgYeq1mZytEgs46fYSqR2jod0PBGxl7HtB/+Y7w4eqH5S05+ijTFa7EZ+afmwOFw
    2hDp5h4Xlhln/oyqVpkot1GOTzI1NgfwmPclHH09DeU6GfzIuuusm6/hFri4IosIUE+O
    tw/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693932829;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AuFmXL4FOpwRV8rqz5EmPfOmGgtqQ2luRd5J1ocsM1w=;
    b=NgMhlGJEopzk7I7azDKNDKGbluKnOhZZ84sj3luesb6guCfZvHfUwPcESu/z0O/S7C
    AI1T11pRwfMhwIfWhvxnjGgqmdK/dNeWDmQ2UzlE7uS7nkfBDoDSI0ysJjKEuNYmKT6t
    I7syTULxg3GIYljkXsIDNFToxnLg3XQ7mdsWSvUyqqp06IVdR+tuqvwN5vwLGMZvZ2fi
    7j1uW8jlf6Spwv3ZuB+XF08n7TcsgGk+Ns87iVwP3yqpfbbYTeCj1KA5MA1qeTF59vxZ
    xta37wji2yPntvAdlW9miRCZD9X45WwQB6oztPQHQAq9B84JnH9l6WkBy+JGHvkU+FVd
    kEVg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693932829;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AuFmXL4FOpwRV8rqz5EmPfOmGgtqQ2luRd5J1ocsM1w=;
    b=QRumSb35Hn7Np29fhtJxVoROYjN+tO3ezdOFAozxHY4Rl4pkfp/dn5qWz2001lBTGN
    vWi4vRrqBXQf9oexOv0zLnlwnU9Z5nWZKV4OkP2yVa5ASNv31Fg+BggpQexD3q8qpmFf
    PRCwCdGmmX3jL2PerZHsnEyhdVc+LLXaQz2nvZt0nJtXTJdQ83yk1hUO3Tr67nwyLJDb
    KBq6KCtLBqFVX/W3siG8DvPCcMKbIbm2xO8LInf+Pj1p13yQ5f7MsAhw8vTwVukxY5+u
    K8q2kW/O1UFUNobmKSP+bDMCJEK0j/xwIQlTmM4/4GRSkRh1jezjbZkfeMrgAiQRl+VG
    128Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693932829;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AuFmXL4FOpwRV8rqz5EmPfOmGgtqQ2luRd5J1ocsM1w=;
    b=ykuVdZ0VdXqHArnfr4W7mULxJi7YO4T5HZ+1qqDicSzrqV90syA6IWyaLoJ9qyayZX
    0ZxeQZOrVzz5vvGyiuCg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZizY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85GrnMhP
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 18:53:49 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.4\))
Subject: Re: ABE/AESS on modern kernel: clocks, hwmods etc.
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <CEFFAFC4-A965-4A91-AB5E-80624BA153DC@goldelico.com>
Date:   Tue, 5 Sep 2023 18:53:48 +0200
Cc:     Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Patrik_Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        =?utf-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1BD4611A-AEB9-4202-AED3-D06DFAF142A1@goldelico.com>
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
 <C6C48500-26FD-4F2C-9521-C739B57C9576@goldelico.com>
 <CEFFAFC4-A965-4A91-AB5E-80624BA153DC@goldelico.com>
To:     Andreas Kemnade <andreas@kemnade.info>
X-Mailer: Apple Mail (2.3696.120.41.1.4)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



> Am 05.09.2023 um 17:48 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>=20
>> Am 05.09.2023 um 17:09 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> Hi,
>>=20
>>> Am 05.09.2023 um 16:44 schrieb Andreas Kemnade =
<andreas@kemnade.info>:
>>>=20
>>> On Tue, 5 Sep 2023 14:42:03 +0200
>>> "H. Nikolaus Schaller" <hns@goldelico.com> wrote:
>>>=20
>>>> Hi Tony,
>>>>=20
>>>>> Am 05.09.2023 um 08:12 schrieb Tony Lindgren <tony@atomide.com>:
>>>>>=20
>>>>> The key observation is that the abe_iclk references in the DTS =
seem to be nowhere referenced =20
>>>>>> (which may or may not be an issue):
>>>>>>=20
>>>>>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap44xx-clocks.dtsi#L509
>>>>>> =
https://github.com/goldelico/letux-kernel/blob/letux/aess-v12/arch/arm/boo=
t/dts/ti/omap/omap54xx-clocks.dtsi#L161 =20
>>>>>=20
>>>>> So I guess the ick is in the dts the ocp_abe_iclk@528 for omap4 =
and
>>>>> abe_iclk@528 for omap5. Seems like the driver should request them, =
I recall
>>>>> that the interconnect target module does not need the ick to =
access sysc
>>>>> and revision registers. =20
>>>>=20
>>>> Yes, that is what I suspect but I don't know how to request them.
>>>>=20
>>> add ,"ick" to the clock-names line in the target-module?
>>> and ,<&ocp_abe_iclk> to the target module?
>>=20
>> You mean
>>=20
>> diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi =
b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
>> index 7ca7b369b4e59..aa140a8bb9f29 100644
>> --- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
>> +++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
>> @@ -482,8 +482,8 @@ target-module@f1000 {                       /* =
0x401f1000, ap 32 20.0 */
>>                                       <SYSC_IDLE_NO>,
>>                                       <SYSC_IDLE_SMART>;
>>                       /* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm =
*/
>> -                       clocks =3D <&abe_clkctrl OMAP4_AESS_CLKCTRL =
0>;
>> -                       clock-names =3D "fck";
>> +                       clocks =3D <&abe_clkctrl OMAP4_AESS_CLKCTRL =
0>, <&ocp_abe_iclk>;
>> +                       clock-names =3D "fck", "ick";
>>                       #address-cells =3D <1>;
>>                       #size-cells =3D <1>;
>>=20
>=20
>> Well, certainly worth trying!
>=20
> A quick test on PandaES shows that the ick is (or becomes) active (I =
have not yet compared to without above patch):
>=20
> root@letux:~# ls -l /sys/kernel/debug/clk/ocp_abe_iclk
> total 0
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_accuracy
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_duty_cycle
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_enable_count
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_flags
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_max_rate
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_min_rate
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_notifier_count
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_parent
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_phase
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_prepare_count
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_protect_count
> -r--r--r-- 1 root root 0 Jan  1  1970 clk_rate
> root@letux:~# cat /sys/kernel/debug/clk/ocp_abe_iclk/*
> 0
> 1/2
> 1
> 4294967295
> 0
> 0
> abe-clkctrl:0008:24
> 0
> 1
> 0
> 49152000
> root@letux:~#=20

There is indeed a difference after removing, recompiling, rebooting:

root@letux:~# cat /sys/kernel/debug/clk/ocp_abe_iclk/*
0
1/2
0	<----
4294967295
0
0
abe-clkctrl:0008:24
0
0	<----
0
49152000
root@letux:~#=20

BR,
Nikolaus

