Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92C7214CDB
	for <lists+linux-omap@lfdr.de>; Sun,  5 Jul 2020 15:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgGENxp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 5 Jul 2020 09:53:45 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:29762 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgGENxo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 5 Jul 2020 09:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1593957221;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=v6J2S0eib8wKFNo5EYt0US11Tk7XmGzvX7A0J+ietzA=;
        b=TuWQ0leDBiAOjqKCET/Hq52VjtEc6Gn6PkQeWZx5BHVofpunGkI1q9XFnPbeozLqPr
        DoEurvshkSHDOqtVC8ejBh0N/CL6cZAkuRLkwyJalpNTWZ/swZS9rQsWmuA3rA01lNOn
        AH3VLaIFi5lW+jZ2D9W/yFj3yjxgWlzPh3CDsjySf/HBMyW1WIivm8KaMlcvLYWqfxUC
        g5OBwdl+tmtyVro+lpzPZ2DtWbZh4IQP6oEDSL9yRrbz7UPp0PKU8zJheKVh3Wojwz6L
        DMC3WUnDHXV8WO5/vSZW2St+5v3KZUuqik/0rT7If57ft5hm5uesENur9nyG+Ar2JnhP
        xnxQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrqwDCpBMA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w65DlcmYn
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 5 Jul 2020 15:47:38 +0200 (CEST)
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com>
Date:   Sun, 5 Jul 2020 15:47:37 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com> <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 05.07.2020 um 09:40 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
>=20
>> Am 05.07.2020 um 08:52 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>=20
>> Hi Tony,
>> since v5.7-rc1 our Pyra (OMAP5) dsi panel doesn't initialize and we =
do not
>> get a /dev/fb0.
>>=20
>> There is a suspicious log message:
>>=20
>> [   15.352314] DSI: omapdss DSI error: unsupported DSI module
>>=20
>> I could trace it down to be likely a discrepancy between
>>=20
>> target-module@58000000 {=20
>>=20
>> ...
>>=20
>> 				target-module@5000 {
>> 					compatible =3D "ti,sysc-omap2", =
"ti,sysc";
>> 					reg =3D <0x5000 0x4>,
>> ...
>> 					ranges =3D <0 0x5000 0x1000>;
>>=20
>> 					dsi1: encoder@0 {
>> 						compatible =3D =
"ti,omap5-dsi";
>>=20
>> 				target-module@9000 {
>> 					compatible =3D "ti,sysc-omap2", =
"ti,sysc";
>> 					reg =3D <0x9000 0x4>,
>> 					      <0x9010 0x4>,
>> 					      <0x9014 0x4>;
>>=20
>> ...
>>=20
>> 					ranges =3D <0 0x9000 0x1000>;
>>=20
>> 					dsi2: encoder@0 {
>> 						compatible =3D =
"ti,omap5-dsi";
>> 						reg =3D <0 0x200>,
>> 						      <0x200 0x40>,
>> 						      <0x300 0x40>;
>>=20
>>=20
>>=20
>> and
>>=20
>> static const struct dsi_of_data dsi_of_data_omap5 =3D {
>> 	.model =3D DSI_MODEL_OMAP5,
>> 	.pll_hw =3D &dss_omap5_dsi_pll_hw,
>> 	.modules =3D (const struct dsi_module_id_data[]) {
>> 		{ .address =3D 0x58004000, .id =3D 0, },
>> 		{ .address =3D 0x58009000, .id =3D 1, },
>> 		{ },
>> 	},
>>=20
>> Therefore the address match logic in dsi_probe() fails and ends in
>> the mentioned log message.
>>=20
>> Looking at git blame, the DTS was recently changed by =
5a507162f096b54.
>> Commit 98e1a6a86a22d62 did do a similar change for dsi2 but did not
>> modify the address.
>>=20
>> So I wonder if the 0x5000 is just a typo or if there is something
>> where the dsi1: encoder@0 should have a negative offset to end
>> up at address 0x58004000?
>>=20
>> BR and thanks,
>> Nikolaus
>>=20
>=20
> This patch makes the DSI error go away and omapdrm initialized:
>=20
> diff --git a/arch/arm/boot/dts/omap5.dtsi =
b/arch/arm/boot/dts/omap5.dtsi
> index e147121513e644..b9f54f62163879 100644
> --- a/arch/arm/boot/dts/omap5.dtsi
> +++ b/arch/arm/boot/dts/omap5.dtsi
> @@ -474,7 +474,7 @@ rfbi: encoder@0  {
>                                        };
>                                };
>=20
> -                               target-module@5000 {
> +                               target-module@4000 {
>                                        compatible =3D "ti,sysc-omap2", =
"ti,sysc";
>                                        reg =3D <0x5000 0x4>,
>                                              <0x5010 0x4>,
> @@ -490,7 +490,7 @@ SYSC_OMAP2_SOFTRESET |
>                                        ti,syss-mask =3D <1>;
>                                        #address-cells =3D <1>;
>                                        #size-cells =3D <1>;
> -                                       ranges =3D <0 0x5000 0x1000>;
> +                                       ranges =3D <0 0x4000 0x1000>;
>=20
>                                        dsi1: encoder@0 {
>                                                compatible =3D =
"ti,omap5-dsi";
>=20
> But I still have no display:
>=20
> [   17.537515] [drm] Initialized omapdrm 1.0.0 20110917 for omapdrm.0 =
on minor 2
> [   18.558950] omapdrm omapdrm.0: [drm] Cannot find any crtc or sizes
>=20
> So there is more to fix.

A little more info:

on v5.7 I see:

[   13.850883] omapdss_dss 58000000.dss: bound 58001000.dispc (ops =
dispc_component_ops [omapdss])
[   13.885714] omapdss_dss 58000000.dss: bound 58040000.encoder (ops =
hdmi5_component_ops [omapdss])

while on v5.6:

[   14.997890] omapdss_dss 58000000.dss: bound 58001000.dispc (ops =
dsi_vc_flush_receive_data [omapdss])
[   15.007726] omapdss_dss 58000000.dss: bound 58004000.encoder (ops =
dsi_vc_flush_receive_data [omapdss])
[   15.026118] omapdss_dss 58000000.dss: bound 58040000.encoder (ops =
dsi_vc_flush_receive_data [omapdss])

So the dsi1 encoder isn't properly bound.

BR,
Nikolaus=
