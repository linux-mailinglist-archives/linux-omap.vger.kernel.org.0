Return-Path: <linux-omap+bounces-2460-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2640B9A4B5F
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2024 07:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FD8DB2267D
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2024 05:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595971D798B;
	Sat, 19 Oct 2024 05:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvA7dBgH"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA95478E;
	Sat, 19 Oct 2024 05:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729316779; cv=none; b=ZPAmM5mUSa+uAhQ0vYbi4aIOMZFq8l1rE+iQVMwBIyy5Y7hmcjWwX6/AVruyfb8p0PJ/c5yhtI30N9KdV1eUMxYuQsOmmdccRCPKGeplWBdHKGp/hZubAihl1/SCDMs6ublwlk9+dPfoY4TrEMInPfc/LybgCbRtbFqiYUAV1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729316779; c=relaxed/simple;
	bh=RRK0d5O3+eFc8tOfdqBi70X6wmeZkUievoZshWFIsz0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:To:Date; b=ppvnJ4RUsfPOBFE9XonVL5KBSE2ekbmb162aWrSfWkJhJf671RN+VSTix2vGjmeUs8kzbG9TrWMe1Q5wgUYCCfTOg/3LkRxTt0f905r7Smq6jEHXVfcYHT+FH+hWsnN4aKtm53WgPc9kQ/hyDKZUJyZb9yjA8GL/BpolUO+w4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvA7dBgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5AEC4CEC7;
	Sat, 19 Oct 2024 05:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729316776;
	bh=RRK0d5O3+eFc8tOfdqBi70X6wmeZkUievoZshWFIsz0=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=JvA7dBgHQXXwHKkAmxjm2hI7zVmGj7NF/WXklQFlLem1ZpxLN8XrhVY3MCk157rI7
	 buBVlyxJ+uqfmANt9I7JffsQoJfjInZKVeNdS5n3cwpmBxDR041WGMOh6myR1prs7y
	 wszn52FoE0oghaMDeM7S05H7cXlh6WgMWIhEQ9xJSbwWfMg/kClZyS73FOj8xPyohF
	 6ncA1/1H4KaPCWOtVMHCPJ6V//XyFwJXRZcCh22eOLS4oG3ieOI98XT/O1LT2DZY4F
	 vowXJy8+2BWNVf3Bt661N/0YBeOnwYZjsX/MStXGMZhng5NOm/877xThHbCUb3DMAW
	 ffIMKZd3RJtvg==
Message-ID: <5529f20ba6488c3eb94cec1e26b52068.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241018085347.95071-2-andreas@kemnade.info>
References: <20241018085347.95071-1-andreas@kemnade.info> <20241018085347.95071-2-andreas@kemnade.info>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: ti: Convert interface.txt to json-schema
From: Stephen Boyd <sboyd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Fri, 18 Oct 2024 22:46:14 -0700
User-Agent: alot/0.10

Quoting Andreas Kemnade (2024-10-18 01:53:46)
> Convert the OMAP interface clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next

