Return-Path: <linux-omap+bounces-2546-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19B9B7634
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 09:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5BEB285724
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 08:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33FB153BE8;
	Thu, 31 Oct 2024 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XX45PSYO"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA6C7E59A;
	Thu, 31 Oct 2024 08:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730362734; cv=none; b=CDdRc5rFteUl+WA1xBhEcUA2uqPaH6XQGkpKe8DKW3iSzTMCPQQs8fnJa/7oMtxd2yu/O9WywH7Fw+aog5kjlkImkzYGf3B9zrDY+2/ZoJXWR759ayWEVjaS1YDnf24Gpzu9xKFAleqy9V+UHCBc8x3ppJU4KY0J1/SPZe+Z+2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730362734; c=relaxed/simple;
	bh=kSsM/nW/TCC/rQiWCePnYj6XEURc0s4gHPiZvFg6n38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmoVubmPoCJ1lr9XUQAtAIazru81dpF5uhpWUjNtuBzwXFYB5JHsn1iHgNw016UQR1VqbvyWegme2PGZucsJPx4hoFPdruZ9E5Pj1ECb0/sR39KnOYgF0ZJQq1/8AdN4a9mrX82l5K9zPJP3LtIbdr9GuAqUwYPu7NVuv+4I5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XX45PSYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2DF0C4CEC3;
	Thu, 31 Oct 2024 08:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730362733;
	bh=kSsM/nW/TCC/rQiWCePnYj6XEURc0s4gHPiZvFg6n38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XX45PSYO+CFtHBTGgf3kvt1p7oN99WP+B/VeYCe4Uj0G7xM75/Y395zkSQ1w+B5SP
	 FcFR5clsb2csIXkbb5wJePkBiczXIMBmSzRWzT7XL7jh4VRNYhgFEji8C/JSLKqDG6
	 tYK4VWxDCMzmp486KS0TP7QT48C2rZeVeI3BvUi9HjrTC1swni8pvRgxAD5op1q7BC
	 hG808w+hB6cRd8FCx11HcmtJRVRMCCgSUC6OMJe2h15G+VezM47ptEkS7l3+RxQyve
	 ZztbOLvU1HsOv7/iOpJ/oeSvLiQWsPtut+XUXOgv82JyWmH7lOmjaO4qD0wwGQqp3v
	 X8wjvDVyfJ0aw==
Date: Thu, 31 Oct 2024 09:18:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
Message-ID: <46rktrrcnpl53nt3o7qe24cd4wp3cjq2v4sbno5oxdrgyazzfj@uqr5kt7pm2x5>
References: <20241030211847.413-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030211847.413-1-bavishimithil@gmail.com>

On Wed, Oct 30, 2024 at 09:18:43PM +0000, Mithil Bavishi wrote:
> Add samsung-espresso7 codename for the 7 inch variant
> 
> Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

This is v2, so where is the changelog? Same for all other patches. No
cover letter, no changelogs in patches.

Best regards,
Krzysztof


