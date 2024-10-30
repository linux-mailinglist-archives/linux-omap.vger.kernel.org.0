Return-Path: <linux-omap+bounces-2531-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B15289B6D2D
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:55:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E33028234C
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B201D0E03;
	Wed, 30 Oct 2024 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="tfIDrgZk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1F7199EAB;
	Wed, 30 Oct 2024 19:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730318147; cv=none; b=hrGDTY0iiLMjuKVXVr5S7QJUjiogzHcizoZFLhNiXcwb3/aFf14jEkgwq97S+6b/3BOHZgoyEsY5hE8Y4o+6z6xBWbxuCogPFxFJmccW4zwHnJ+bch/vPmLj0pueL+Bw4k99LKgHTF+9a+vx1QmYqo78kenYl3fi19szdUyoJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730318147; c=relaxed/simple;
	bh=3Yry6e2i+Q/8y/Y7GYu/r3LM2bG17cY37ERXt9ayWc8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AinewEwYxNERIGlOgMCqW8VU8p/Lj1Raa8cNn/vpvq8PCW+Lur0YiHDzLW8vQ0aVMzPUHTcZ7Hr63yZMYjK73u3+uX9dPtjDdADRv6N1AoWRPj00ooRXp85m8s7w+qu5Hzlv6Isr5Y3EbeWOTe1oGmLQcouOQiupNbISrjNOvOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=tfIDrgZk; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=m1ax2i/8ssdJf3PBk2bD9mf6fEXIgj3s1i8YvLv/bF0=; b=tfIDrgZkdOpSX0u2Jz4SGMxapW
	u/LoRFA2AgLKEd+B9zNS1nZJ8Cm40kQERuNs69Wk5xTIIL1xMTCWRQCZZCb1Z/6pqpRtAYOP7cfFi
	tkqYtj/k3dxSYqiY075XTBRhoIWKbGx2BWqYZVavSqKFtEhtrDWwyq3X5EATSd+5KOQXesQQYb4oG
	yq/MbEkgpSqUn6JzXdeSUtOJIBj+6673H1cUvOP5pZTxirvaNjO6DS5k1iN3kjmCjU9jeAqxWXTZg
	xU6yjKT0biJhMIhwczUqjNeadenhUwnKSwUbjw85jEqrdWNF31EvW7eGWt3EnVC1+koxX3XAOyknQ
	rF3BadUg==;
Date: Wed, 30 Oct 2024 20:55:35 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v1 2/6] arm/dts: Add common device tree for Samsung
 Galaxy Tab 2 series
Message-ID: <20241030205535.7ea507ea@akair>
In-Reply-To: <20241030194136.297648-3-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
	<20241030194136.297648-3-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

a quick first pass of review.

Am Wed, 30 Oct 2024 19:41:32 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> Create common device tree for Samsung Espresso series devices
> 
> Differentiate based on screen sizes, panels, touch controllers,
> and batteries
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
[...]

> +	backlight_pins: pinmux_backlight_pins {

- instead of _ in node names please, also for other places:
    backlight_pins: pinmux-backlight-pins

[...]
> +
> +#include "twl6030.dtsi"
> +
really??? you include both twl6030 and twl6032. That does not make any
sense. Including twl6030_omap4.dtsi might make sense but not
twl6030.dtsi.

Regards,
Andreas

