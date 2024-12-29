Return-Path: <linux-omap+bounces-2919-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE29FDFB8
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 16:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3AFF188245C
	for <lists+linux-omap@lfdr.de>; Sun, 29 Dec 2024 15:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33FDC18BC3F;
	Sun, 29 Dec 2024 15:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEtiZzPG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23817083A;
	Sun, 29 Dec 2024 15:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735486260; cv=none; b=KwOQU29FPi/1Ib9pDqsnPYbjSLRt82rtxk+iiWmE2FXxlNXQ+E1v/17flJQbmL5R33oZAVq4GM/iQNY9aXKW3fHw39YUdxqcd/QMhgozyLszOeq8E2i3SxRwkZM2wAU1iBD/lKbXu6pamiKCURrpVfHSjY40aNojZOkq2WzSgto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735486260; c=relaxed/simple;
	bh=gx4ySKcacwUc3HORUH8zTWHyXS9kDPTmEK7EdeNVu2U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=LE2QJBWn77AyIJZoaTFSmb9A9QMvrsuzcynX/WaMbEkzRHdSkQM6TCNilToXE1xZLeyNzs8RTBFAlyQoZR7OnOReLT9t9j/goZhm+zlXOCcB5SeA/jlMLFnPMd1TRT+K+FM/s1xRT6A9OO2Vyc642fC19wp17eSU8ZZUv1zexHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEtiZzPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86D4C4CED1;
	Sun, 29 Dec 2024 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735486260;
	bh=gx4ySKcacwUc3HORUH8zTWHyXS9kDPTmEK7EdeNVu2U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LEtiZzPGgR6cl5DdZzDLfDheSm7BOo9JPhEQAo4yMYRqvhAIxJuEha7nbk+UJ1t3s
	 etu6emXNzY0FkCKDG8z+9Ok+h6N6t+cx2/+AVuOi2Ov+TpKXEeoaKabrAAdDdNEp7H
	 Iy43Mj66V3R5pBobIRHMC/br9ZlbxO/mTTnLY3gAmTp06buNr6Zn3t3e5XnbRQyltD
	 T00LyH96RWv4Fsu/2HOYYw0U2cKw9Iv63Edmh3z2TIhKKDWrts2Anl0PGi7W/cUu37
	 d/bRqzk4MsqPAVaI682LvOJiRLcXTw0xMzU935rwc9wajgZKmI0Ub0RPB2v1O2yNVa
	 5EMLF247xSMnw==
Date: Sun, 29 Dec 2024 09:30:58 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-clk@vger.kernel.org, Tero Kristo <kristo@kernel.org>, 
 Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>
To: akemnade@kernel.org
In-Reply-To: <20241229135351.5014-3-akemnade@kernel.org>
References: <20241229135351.5014-1-akemnade@kernel.org>
 <20241229135351.5014-3-akemnade@kernel.org>
Message-Id: <173548625834.3975164.12604542224025301344.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: ti: Convert composite.txt to
 json-schema


On Sun, 29 Dec 2024 14:53:51 +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Convert the OMAP gate clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/clock/ti/composite.txt           | 55 -------------
>  .../bindings/clock/ti/ti,composite-clock.yaml | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/composite.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,composite-clock.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/ti/ti,composite-clock.example.dtb: /example-0/bus/clock-controller@a10: failed to match any schema with compatible: ['ti,composite-interface-clock']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241229135351.5014-3-akemnade@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


