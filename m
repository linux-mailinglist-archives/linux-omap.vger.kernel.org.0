Return-Path: <linux-omap+bounces-5074-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2638C94133
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F236A3A2095
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ABF1F3BA2;
	Sat, 29 Nov 2025 15:33:44 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E191EA7F4;
	Sat, 29 Nov 2025 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430424; cv=none; b=fG8JHKWehaw5NZonCLFAUTN0YGeI8O5NZtahX34XJRUzu8BTDY4cdIlSpnjLOaQAMsLV/UShiuSNp98Ek4tLx+DQhJb3YRzkGCm0S5HbK+eJwT4oU3sKsBCicVTujpxey0GWf+fHpBJ7MMpueSbEOffbw7/X5EngD+usYWW8Wh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430424; c=relaxed/simple;
	bh=dU7B6z+rZCixYSv6NG9Z/njREZ0U4zpgTam0UXKn0nA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=hANRHe/QKXRQbeW4CpUzyCgLzftHoSbnOhhUNVjuzMu7EUyeqUhnnKTQcGT0T4m1IjSNoeMitkzOsZdZXvZuuNMmmI51E0Sa0pzHukxFGZ26WVc8ot1J/Qsl/atbtVGNYHnHa5Wyw1w/RSwo/oLYSB45pTIcF7tjuBX0Ex2e3Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A0A9111C05F;
	Sat, 29 Nov 2025 16:33:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id R5GMfTpW88Zp; Sat, 29 Nov 2025 16:33:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2D88E2C14AB;
	Sat, 29 Nov 2025 16:33:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zEXPoMPlw85S; Sat, 29 Nov 2025 16:33:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id E70CE2C14AA;
	Sat, 29 Nov 2025 16:33:38 +0100 (CET)
Date: Sat, 29 Nov 2025 16:33:38 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	dakr <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mark Brown <broonie@kernel.org>, tony <tony@atomide.com>, 
	rogerq <rogerq@kernel.org>, khilman <khilman@baylibre.com>, 
	Andreas Kemnade <andreas@kemnade.info>, 
	aaro koskinen <aaro.koskinen@iki.fi>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
Message-ID: <771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
In-Reply-To: <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org>
References: <20251129142042.344359-1-richard@nod.at> <20251129142042.344359-2-richard@nod.at> <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property:
 has-inaccessible-regs
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF144 (Linux)/8.8.12_GA_3809)
Thread-Topic: dt-bindings: Document new common property: has-inaccessible-regs
Thread-Index: bPmBJJrGVUd4KMbl9WY311auULoC4Q==

----- Urspr=C3=BCngliche Mail -----
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> On 29/11/2025 15:20, Richard Weinberger wrote:
>> This property is used to denote that a certain register map contains
>> registers that are inaccessible under conditions only a device driver
>> can know.
>=20
> So device driver controls fully their exposure via sysfs.
>=20
> Binding cannot help here at all.

The driver does not expose them via sysfs, it's the regmap framework via de=
bugfs.
=20
>> The purpose of this property is to disable register access through debug
>> facilities outside of the device driver.
>=20
> You described OS policy which is not suitable for bindings at all. Plus
> commit msg really mixes up two separate points - buggy driver which
> fails to properly set regmap (or other facility) with some DT-based
> restrictions.

I kind of expected this answer. ;-)

Currently arch/arm/boot/dts/ti/omap/dra7-l4.dtsi binds CTRL_MODULE_CORE to =
the syscon mfd driver
and various child nodes bind to subranges.
e.g.
scm_conf: scm_conf@0 {
        compatible =3D "syscon", "simple-bus";
        reg =3D <0x0 0x1400>;
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges =3D <0 0x0 0x1400>;
        has-inaccessible-regs;

        pbias_regulator: pbias_regulator@e00 {
                compatible =3D "ti,pbias-dra7", "ti,pbias-omap";
                reg =3D <0xe00 0x4>;
                syscon =3D <&scm_conf>;
                pbias_mmc_reg: pbias_mmc_omap5 {
                        regulator-name =3D "pbias_mmc_omap5";
                        regulator-min-microvolt =3D <1800000>;
                        regulator-max-microvolt =3D <3300000>;
                };     =20
        };     =20

        phy_gmii_sel: phy-gmii-sel@554 {
                compatible =3D "ti,dra7xx-phy-gmii-sel";
                reg =3D <0x554 0x4>;
                #phy-cells =3D <1>;
        };     =20

        scm_conf_clocks: clocks {
                #address-cells =3D <1>;
                #size-cells =3D <0>;
        };     =20
};

So, drivers like ti,pbias-dra7 or ti,dra7xx-phy-gmii-sel touch only registe=
rs
they know about and this works well.
But syscon manages the whole register map via regmap, and regmap exposes it=
 all
via debugfs.

What solution do you propose?
Splitting reg =3D <0x0 0x1400> into many tiny fractions and not using an mf=
d anymore?

Thanks,
//richard

