Return-Path: <linux-omap+bounces-2693-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3169C9335
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 21:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2079E282D30
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 20:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E181ABED8;
	Thu, 14 Nov 2024 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvDq6FKt"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A608819A2B0;
	Thu, 14 Nov 2024 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731616022; cv=none; b=N6Weo9K1ALwp9Ks528f+oXzw1Tgv68JramFu21g0RXDNx8ED+GidmusMRs5A2Sc2DI4s8jkaRJbBn0+dcgVspm4RfL08SR1/DQJ60Qju1OAODUV6ZHfHNYYKYEMEuw3y0yB23sGxVWm1TpTD0nx3XjpQxOE1SvuKXC9fZ0+w3TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731616022; c=relaxed/simple;
	bh=T/MlsQCBxq63E2diTdRnMri4nZCowI5RDnWUyreZuk4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=gDkZTyThilzsKcJG5q4I/rQ0bjUpXjoYzH8Tprrmzqrs/DOcJRSUnVBQOgS6zLysIqlIvGZlB/R3tciQnU3Kx61X6vktBG2S+8bGpNZUp99HxuDmjgWtcUpRAL4xebliHOVWRkwevSLjy1in76dmEYRMOmtxcVyPLr6223pHKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvDq6FKt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648F4C4CECD;
	Thu, 14 Nov 2024 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731616022;
	bh=T/MlsQCBxq63E2diTdRnMri4nZCowI5RDnWUyreZuk4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nvDq6FKt8/7GufhdJ4iL+LFcEa1bE66cn9ugHFi0lckmXTq6IzZXpOezlc870UfC8
	 YuOwGT878leOjwbRFJfeY0E41Byw/c+ec9ouljIzhXLb4Ij1aHT7x+ZVRON1rzd623
	 kZ/3XcDFOtaJz1TEX0p9Gide7eubbtO2FsdhyU49+lM3vmka0TERlaCKjLFvTTk+e8
	 wFSAaC0U6AomGVMSA/9K46nAekQGribMWjBuUwJS6ti/3lLG32UA/AuHIjTS3rdJQY
	 aECx6kru5InPbxcRCi8A80+gbh1hb3y9caINnT8WHxQKa9KL9zCrwJ7mmMqBfeKDEz
	 VIx3OpaVjxqtg==
Message-ID: <63e705b505175f6ebd32ebc7d19384ff.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112162618.400194-1-andreas@kemnade.info>
References: <20241112162618.400194-1-andreas@kemnade.info>
Subject: Re: [PATCH v3] dt-bindings: clock: ti: Convert mux.txt to json-schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
To: Andreas Kemnade <andreas@kemnade.info>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Tero Kristo <kristo@kernel.org>, Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Date: Thu, 14 Nov 2024 12:27:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Andreas Kemnade (2024-11-12 08:26:18)
> Convert the OMAP mux clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> Choose GPL-only license because original binding was also GPL.
>=20
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

