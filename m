Return-Path: <linux-omap+bounces-127-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0D804C2B
	for <lists+linux-omap@lfdr.de>; Tue,  5 Dec 2023 09:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D4C1C20D49
	for <lists+linux-omap@lfdr.de>; Tue,  5 Dec 2023 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966DC3C08D;
	Tue,  5 Dec 2023 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="drkzI+66";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="RAxcCIr8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A388FA;
	Tue,  5 Dec 2023 00:22:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701764350; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=p66+Ug7uzglePQCLWqkW9tjVBxj8AwDs5/Xq/8nxRvTbGIuamajNf3WB31lpw8WikC
    NcCawP6jBGG3mOUj+PZc/n+9J1xiIx+l7/XLGUO+vyWJ76RR0SRZ5m1z7GIgrAH3UVqA
    tZNyf9J/3GLkhTRzsMBA23rR+5SOx0gBDwLJfRacEWjCY3Icvn7/6ENuTxo/qDcHAzBV
    vt1bzBI4kTDNvLriZUQQO/Y7h464R2+e6SaTFmhJSj08W5jj++OfBWmoligfws51iKGe
    PySuxZgrkHQ87hFdS8RWEJ3e8fvVapxMimESJkEt8xFB6rQnWwwOqzlMnToEWJmxu9IQ
    DmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1701764350;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=odPhm436ISvT7VKLcfyOmfs3EuVOCsWY2FepwEECbUg=;
    b=Q1XTTbOQdU+7qDOzWOTm0t3bsM4bYDNlX6TUoNVvZMDFRX4/h0ELH7ByQACD3D4W2l
    6DJGTnQKy4ZuWaP4CMQI1jw9G2G8GbQiCwS4gxJ7ma2TbSIEiPvjtdq+jTf7LuIFH36Q
    O6Ca7+9jYxv2Av+A7I7c0THRFWmpCTKDuiXimXju7m6hMJ5f4OQ7cXjT6sbZ8aqop9tT
    pG1hg4R+zrfzHVKFTo4Ylu7CIm+TB2Ihrrt+BU3QOKEGTrTguA9j2P33MHm7VzQaGNS2
    eiSAM1S2iKvHeQhrthpYQJ2ILJf1ibyfuUkW1+7pMhd8NmgMzv/LfEcbeqi4XLT9vJTB
    RLwg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1701764350;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=odPhm436ISvT7VKLcfyOmfs3EuVOCsWY2FepwEECbUg=;
    b=drkzI+66B+Ck2SEKw+3acz3SAJ9dF2QJb/8/eCsUPQFJJ4pky3aQ2BzsATinNTUo6J
    6MSPE5eDFv9X1+DtJ8YN5bgiTSccX3p9xuxstkH73oyTVpnKzuKsqPWw5tVpZ+fLQ9a2
    hl/Spi7JJZ0VJE8JtM7idKwYLjqwuh6N1T7wo6WJ6k4IJl42+z/OXLnTwGrt6QABqYOO
    RqD8TiDvnfme4Zht5zMRPSlD/4F1WdqoAbpH2sy+6prPRjvIWaxauRORGFbDy3sO9/oi
    t0K07/KbXFizDqK476oaIYurhvPVKZFO3XzesBdHQhSR8duUplS1eSaU7AmewERJ71wZ
    Am+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1701764350;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=odPhm436ISvT7VKLcfyOmfs3EuVOCsWY2FepwEECbUg=;
    b=RAxcCIr8Zu0MqZOWc7AnelHm7HKq92V7O0+HW0Wk5ZbQR1uWW1/fkxn5UB2gUv/Fm8
    8L5tMRc1EsydkqPZ6qAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeonQ="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 49.9.7 DYNA|AUTH)
    with ESMTPSA id 6c76e8zB58J9Ovm
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 5 Dec 2023 09:19:09 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: Add PowerVR Series5 SGX GPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
Date: Tue, 5 Dec 2023 09:18:58 +0100
Cc: Andrew Davis <afd@ti.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org,
 linux-mips@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B3A1B8A7-0363-4ECB-AFBF-576FECA569FA@goldelico.com>
References: <20231204182245.33683-1-afd@ti.com>
 <20231204182245.33683-2-afd@ti.com>
 <23livt5mcc64bb6lkeec2uxp5cyn4wfekwaj6wzrjnrkndvwgj@6tveqglqpr4v>
To: Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3774.200.91.1.1)



> Am 05.12.2023 um 07:57 schrieb Maxime Ripard <mripard@kernel.org>:
>=20
> On Mon, Dec 04, 2023 at 12:22:36PM -0600, Andrew Davis wrote:
>> The Imagination PowerVR Series5 "SGX" GPU is part of several SoCs =
from
>> multiple vendors. Describe how the SGX GPU is integrated in these =
SoC,
>> including register space and interrupts. Clocks, reset, and power =
domain
>> information is SoC specific.
>>=20
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>> .../devicetree/bindings/gpu/img,powervr.yaml  | 69 =
+++++++++++++++++--
>> 1 file changed, 63 insertions(+), 6 deletions(-)
>=20
> I think it would be best to have a separate file for this, =
img,sgx.yaml
> maybe?

Why?

The whole family of IMG GPUs is PowerVR and SGX and Rogue are =
generations 5 and 6++:

https://en.wikipedia.org/wiki/PowerVR

So I would suggest to keep either img,powervr.yaml for all of them or

img,powervr-sgx.yaml
img,powervr-rogue.yaml

etc.

But as far as I can see the hardware integration into SoC (and hence =
description)
is quite similar so a single file should suffice.

BR,
Nikolaus=

