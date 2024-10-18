Return-Path: <linux-omap+bounces-2456-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094129A4043
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 15:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E634B2220F
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2024 13:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB25204091;
	Fri, 18 Oct 2024 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R10EhPlt"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F7204082;
	Fri, 18 Oct 2024 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729258911; cv=none; b=TXFRUDlhp4YDFZPNmP9co6yy7QqhScVRTvMZ1giQ2BtJ7nayJDGYTG2UJzQMZ8lgxn25yZHFKr6iuNhaaZ3m4ET3L+9148pmDadqOMTEKu1l3JaxzSFGlvvcPrHS20lRnmiBwIGTAHt06+tJjfaVIYG5nM42oLsLkLZDKaX5mI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729258911; c=relaxed/simple;
	bh=21eSaiMs6bSA+M6WRqtBWIC4lt+Jg5SW91YTEzH4tjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zo/J5noc1yz3RT7sQSq3GIjWK1jQGWLtsh/BusSd91Nkf3iAyCAgtOo37T+l1/tD/f1zdEgKsLOhLsNIFd324DPLiwQUO/MvkVGcNXlHdp7xMvRtePqgzdP6eZiOEMNH1tSkIxQ/ujY0TFqmzbVDf3Y57s7S0uglK+iZhAjztcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R10EhPlt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F52FC4CEC3;
	Fri, 18 Oct 2024 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729258911;
	bh=21eSaiMs6bSA+M6WRqtBWIC4lt+Jg5SW91YTEzH4tjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R10EhPltK9KfY0zks8SwL8MVMReYrC6YguS+yuDtHf1G5wxkCtaZWjLa0b2W4eWol
	 oJT+TGrdWEQnUCxvmmnO1EpEQas1W53Z+3Q+2cGE3W/Anmat8nj1WBNME5gRLTQxRn
	 zoUDjpdimAN+FuRKIyoM0vtjxGnPLBYH4Hf21fe5NHAAwWLLBaIoXg4CQFomGawJoV
	 dBKE09EAOwbxmGxQ0XIKIl8ymUMJ+k+29UJgHhCqjv9F7SkHJFn5KcTc507n9SBxwm
	 Gr4axDNR3QUlvi8jz8xl3dEraOhGI0q0z4YBMBIP61R3xhY7qersRTaCkct7kfTbdO
	 Cyj2sGSgAQ0Kg==
Date: Fri, 18 Oct 2024 08:41:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH v3 2/2] dt-bindings: clock: ti: Convert divider.txt to
 json-schema
Message-ID: <172925890948.85490.14873977244491233773.robh@kernel.org>
References: <20241018085347.95071-1-andreas@kemnade.info>
 <20241018085347.95071-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018085347.95071-3-andreas@kemnade.info>


On Fri, 18 Oct 2024 10:53:47 +0200, Andreas Kemnade wrote:
> Convert the OMAP divider clock device tree binding to json-schema.
> Specify the creator of the original binding as a maintainer.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  .../bindings/clock/ti/composite.txt           |   2 +-
>  .../devicetree/bindings/clock/ti/divider.txt  | 115 -----------
>  .../bindings/clock/ti/ti,divider-clock.yaml   | 193 ++++++++++++++++++
>  3 files changed, 194 insertions(+), 116 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/divider.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


