Return-Path: <linux-omap+bounces-2190-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F56976423
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 10:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8287B22B9F
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 08:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08C11917F2;
	Thu, 12 Sep 2024 08:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="SlD/feqP";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="5d2vmuy8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C791191499;
	Thu, 12 Sep 2024 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726128910; cv=pass; b=LP8z8Jzy/j/UlrH/5VpUZGPIVWJOiO5VcIgpq/lFEyqZKWwp9H0+g7NDe5X8RjmH8g4hrj8mE15xjow58isHSVEoR/t15coAbp46iO5BNP8v775FDMMlQZevuTapIvlR6HtFX4tpOcFtn/csAIpfUcjopI0LS6LmWOmCu6HveK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726128910; c=relaxed/simple;
	bh=H2RxP91oTkVhyn625N4T827oCkam97r7DmgJet1F8mI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=f+qN+wue61zwLGTad2TXd4aN1pi0uwi+K0wBLAZGsvmgaTWyx64hWvv6Lm+63SkDZYmOgdSd4j08tlfH9OVjOD24wG12OHU699C7qkT3H8C7c8ByhVmbyqiW4mnIZ0df8tUWXsNuSRnHiMuNXMgNwDpV+Tiqil1XoarbfwVH+Kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=SlD/feqP; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=5d2vmuy8; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1726128540; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=jZB5dkNG/t9uD8/+UjTJ3pg6dPmaNc9Kplb1L6Wm1qHgdX/lAkdc2W1q8HWc7dqt9O
    lEJfbTmRMshaBp6gdmpkRksSqSjbLV1MwjyIDOk8ZbQjEZkJLdovL4JV7sl1Mvb3aPvW
    OWpzgHwUJLeLtYIEPog8IHnF0onXD2oPg7g3HCYdIcqNJDMmto1I77qIDyIdmqxqjfV9
    vEIrqdBYuzTqSXnGMgR9KuY++18PzAve0pbRSqcFMTwh3nXEO9OGMRPxjk/pBKgCwOBS
    u5cxiG2klULPI9JfsjAHjvfaKIqJvBbi51Hn4DjIjk5CPBZl04Hi7vlj/zWoKmG9QsVC
    NbtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726128540;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7oOuMVZyb5hBcyF8Ky9QuaxacwXT5tqF9fJZNv8z3bo=;
    b=E4UOzdDclpjR3D3yZ8UX/NOwRNYwqRarNm4ryyfxdqSMFsjo2Z07sv+fxNtFuFc0+R
    JARAQIAj2+R6s4hjK2f2HPo/7tfkXbaTx9dKhVO1XegyR854FEvUW70geHoS0KMVursi
    r5qzwNw5o0CAk5PZxT5WIk/XLS/XHtaMuBlbNvXTFHvyscBGjz+o8RhAnT4Qfx7d766J
    qF3o4hx9WR9A+Ca/kghYU8X6H10UK0PidrGvg5LB0eJzelhBtApy94iBydjlbHtoPPn8
    YmIQV5eYp1RkRp1vq29b6gW+58V1DAVIyktX17j8W2O6+QswRFva8kBNBy0ZScpFuy31
    gYFg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726128540;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7oOuMVZyb5hBcyF8Ky9QuaxacwXT5tqF9fJZNv8z3bo=;
    b=SlD/feqPB+Id4GIZSAnk55oeqFr5vwkt7HMIdZPYuImi7gDAwy1a96Lz/EIbYKPfh4
    w4wzFVe6j6KKH//6BxXL3F528qzujGDsWR4hGmWG8BMotg1J+4ki7x6gwtcrHuhQ6oom
    rq7X5zCKxhXL8DFLURfqTKI07A9ceq9As6kDNak2Zb+9inqxF1iZy1A+fWgfIUaSya25
    o3jmKM7/ZG2bcQsJZ9qwLq5205u56EoIY43ujPTmVMVx75jWFFJgCVOv79onq5DqNZ4u
    DbqaKmMTnUl03aEMqyAm0SUnkXuoJWmH8RkdUaKgLnGSZS3AvVfcOqmjBFXi3IFg0+8W
    tqHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726128540;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=7oOuMVZyb5hBcyF8Ky9QuaxacwXT5tqF9fJZNv8z3bo=;
    b=5d2vmuy86bxM1L6wmscMtBmtb/hAH/d4Perac+hG2LBt3kjqFgfyAi0FkY794WgyN+
    m05mZrtN4xh1L9/Ra1Bw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDoZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.3 DYNA|AUTH)
    with ESMTPSA id Q984c208C88x2bd
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Thu, 12 Sep 2024 10:08:59 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH] ARM: dts: ti/omap: Fix at24 EEPROM node names
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20240910215942.824137-1-robh@kernel.org>
Date: Thu, 12 Sep 2024 10:08:49 +0200
Cc: Tony Lindgren <tony@atomide.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DD6AD3A-F3D3-48E3-B326-CE874F39E57A@goldelico.com>
References: <20240910215942.824137-1-robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)



> Am 10.09.2024 um 23:59 schrieb Rob Herring (Arm) <robh@kernel.org>:
>=20
> at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi       |  2 +-
> arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi  | 10 +++++-----
> arch/arm/boot/dts/ti/omap/am335x-boneblue.dts      |  2 +-
> arch/arm/boot/dts/ti/omap/am335x-pdu001.dts        |  6 +++---
> arch/arm/boot/dts/ti/omap/am335x-shc.dts           |  2 +-
> arch/arm/boot/dts/ti/omap/am3874-iceboard.dts      |  8 ++++----
> arch/arm/boot/dts/ti/omap/am437x-cm-t43.dts        |  2 +-
> arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts       |  2 +-
> arch/arm/boot/dts/ti/omap/am437x-sbc-t43.dts       |  2 +-
> arch/arm/boot/dts/ti/omap/am437x-sk-evm.dts        |  2 +-
> arch/arm/boot/dts/ti/omap/am43x-epos-evm.dts       |  2 +-
> arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |  2 +-
> arch/arm/boot/dts/ti/omap/am57xx-sbc-am57x.dts     |  2 +-
> arch/arm/boot/dts/ti/omap/logicpd-torpedo-som.dtsi |  2 +-
> arch/arm/boot/dts/ti/omap/omap3-cm-t3x.dtsi        |  2 +-
> arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi         |  2 +-
> arch/arm/boot/dts/ti/omap/omap3-sb-t35.dtsi        |  2 +-
> arch/arm/boot/dts/ti/omap/omap5-cm-t54.dts         |  2 +-
> arch/arm/boot/dts/ti/omap/omap5-sbc-t54.dts        |  2 +-
> 19 files changed, 28 insertions(+), 28 deletions(-)

...

> diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi =
b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> index 3661340009e7..2ee3ddd64020 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> @@ -601,7 +601,7 @@ tsc2007@48 {
> };
>=20
> /* RFID EEPROM */
> - m24lr64@50 {
> + eeprom@50 {
> compatible =3D "atmel,24c64";
> reg =3D <0x50>;
> };

Acked-by: hns@goldelico.com # for GTA04=

