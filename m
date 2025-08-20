Return-Path: <linux-omap+bounces-4279-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98031B2DECA
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 16:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09A956844C3
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 14:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D6C26E704;
	Wed, 20 Aug 2025 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q65285Kb"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD7C2641E3;
	Wed, 20 Aug 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755698943; cv=none; b=ENgv0fbowG6tGfFXzUprvaIM5hIyx/FmGdPzr+4naU1DYzqo+6R2me1XwH40uIjgRT9uoCtXSh+8xa8ZzN+zrwB1MX+/rXlBWmS1OaLnnzvqpYWF6QWgZ17ey2vpCnwsakrNkk7Q2NrlYeRh/vinwuAYCCrXoc9dumb7eu0D5yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755698943; c=relaxed/simple;
	bh=8GNwXhFDUK+QdMGtKEC2x2L7fi25pyc6D2jK6dA+Vs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdQ+UXR8n/VtbLkGy5u4JI95cU4HGR8qDZlyUhYfjiMZZymxX9XSwH0XiEXfAQzuIAWo61ABa+GTecE2v6n+5OEVsqIfQ8yCyotWUMGzq3GTvpvu39XccjdiLMnQdhZ8rgQ+ViJuUDJ0lNAx3B7QW6m0cvlx8qhimUmWsJsd7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q65285Kb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA273C4CEE7;
	Wed, 20 Aug 2025 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755698942;
	bh=8GNwXhFDUK+QdMGtKEC2x2L7fi25pyc6D2jK6dA+Vs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q65285KbRd0VzWFQ3bT2Sr98WEh3bE7hveob8ouhH/owd0dj6ImcPreXi3P/nlMKm
	 qjLt/8DKCiN9r2Qk91KRKVwu2lC2Wo1xSxEWVUk1XVNOi69QDUrO6nOA8LUTnvHEPU
	 ERLi/tKAO+HbBUM1hfBish1/VRHzcm3ChdYPldcbHkCpDhAcKm9oXt0dq8LjQQYiu/
	 1QIXV7tQNpxSC+J36Rkq+0GJBfb9OAhw3q2ZxT6K95UPu0kPMTmv6j9meRsmet1DBL
	 rNIlS3++9fLpUDsUCu1aQvRUmDWZ5wVFY3CtaOJDx3IXv/DJFB+D+ABAWI9W3OBfBH
	 ZLtWumwzK357w==
Date: Wed, 20 Aug 2025 09:09:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: linux-omap@vger.kernel.org, conor+dt@kernel.org, broonie@kernel.org,
	shuah@kernel.org, krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, peter.ujfalusi@gmail.com
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: ti,twl4030-audio: convert to
 DT schema
Message-ID: <175569894135.3348790.4972298739522547890.robh@kernel.org>
References: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
 <20250819201302.80712-2-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819201302.80712-2-jihed.chaibi.dev@gmail.com>


On Tue, 19 Aug 2025 22:13:01 +0200, Jihed Chaibi wrote:
> Convert the TWL4030 audio module bindings from txt to YAML format and
> move them to the sound subsystem bindings directory. This patch also
> refines the schema by adding an enum constraint for ti,enable-vibra and
> updates the example to remove irrelevant I2C clock-frequency property.
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 
> ---
> Changes in v4:
>  - No change to binding content, only updating commit message format.
>  - Split from larger series per maintainer feedback.
>  - v3 link:
>    https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/
> 
> Changes in v3:
>  - No changes.
> 
> Changes in v2:
>  - Moved binding from mfd to sound directory.
>  - Added enum: [0, 1] to ti,enable-vibra for stricter validation.
>  - Removed clock-frequency from the example as it’s not relevant to the binding.
>  - Simplified example by removing unnecessary I2C node properties.
> ---
>  .../devicetree/bindings/mfd/twl4030-audio.txt | 46 ----------
>  .../bindings/sound/ti,twl4030-audio.yaml      | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/twl4030-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


