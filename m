Return-Path: <linux-omap+bounces-5063-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3997C8E87E
	for <lists+linux-omap@lfdr.de>; Thu, 27 Nov 2025 14:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A458F4E36B0
	for <lists+linux-omap@lfdr.de>; Thu, 27 Nov 2025 13:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A25E2BEC28;
	Thu, 27 Nov 2025 13:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YCTTW2Jv"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C396927978C;
	Thu, 27 Nov 2025 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764250913; cv=none; b=We6D/b1Xy1kPAeRTEyoBpiY7lx334zHkZxsIOPkl0FQqgHV4DAJTjcnh5Wi/LOUL6D8zcRcM7KH1nnO88/2whSpIwnalziP7qDmpEd74xsTjcIaAV1k396N7nYg+SvTLa3i4TjmqZRxjkw4pQ97o6+hAtW12P7Qfubapg0A6BHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764250913; c=relaxed/simple;
	bh=0C0ec2t7VLdJmBKmgnrsAHutWDQQX9XJnTOmZEwMrik=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTVUJdn8uXMwii1YEEdnP5Foya4kwVU8r7jJQZvWXRQ5MOuVxZfcN7eyQ/GhcGLJlhrAtABYcojoyCgp4JohqMJJbdGfWKwECg/LDXER7sosv2WL2GHGpqR27MnnePjv+DglgaKTyZ8lPeAAr++IUV0409uRBL7S3gZkG30rEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YCTTW2Jv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7C0BC16A19;
	Thu, 27 Nov 2025 13:41:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8169A6068C;
	Thu, 27 Nov 2025 13:41:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 311B2102F2771;
	Thu, 27 Nov 2025 14:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764250903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0C0ec2t7VLdJmBKmgnrsAHutWDQQX9XJnTOmZEwMrik=;
	b=YCTTW2JvGOER39oApB54JK+qZPEBpl0okPwtulTGyTRPTL6CaN4XnP8NVsUmqGIEbVx9CE
	qLfwO1iLQTN7ZQ4Ohcj4bwnMgzWegpZvz/G1R+zUrpcCR2KqSj6a7Xw2vxF//uRXF/ozmE
	fJGG5DMDSP2wUfwQu40KXVsnE6Yf1iv5MdMP05f4pvSYIj9assq3ADlDiz8eSYvUI5RdEB
	yxEpSSfbPHCKcxqmNArOMr7ukJIJyp7urzX0yULScUmvn7r2p57vZA69OC3TsVzGXfEiuW
	NwcxEYf9lalj8NwxYF5OnL4mtBaGW1vUxZbsiz0cESkaa2ZswkaaxgSLV1pqCg==
Date: Thu, 27 Nov 2025 14:41:38 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Lee Jones
 <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: Andrew Davis <afd@ti.com>, Bajjuri Praneeth <praneeth@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Enable 1GHz OPP am335x-bonegreen-eco
Message-ID: <20251127144138.400d1dcd@kmaincent-XPS-13-7390>
In-Reply-To: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
References: <20251112-fix_tps65219-v4-0-696a0f55d5d8@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 12 Nov 2025 16:14:19 +0100
"Kory Maincent (TI.com)" <kory.maincent@bootlin.com> wrote:

> The vdd_mpu regulator maximum voltage was previously limited to 1.2985V,
> which prevented the CPU from reaching the 1GHz operating point. This
> limitation was put in place because voltage changes were not working
> correctly, causing the board to stall when attempting higher frequencies.
> Increase the maximum voltage to 1.3515V to allow the full 1GHz OPP to be
> used.
>=20
> Add a TPS65219 PMIC driver fixes that properly implement the LOCK register
> handling, to make voltage transitions work reliably.

Hello,

What is the status on this series?
Is there anything that could prevent it from being merged?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

