Return-Path: <linux-omap+bounces-2515-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 847159B5F80
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 10:59:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5DDB1C210E4
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 09:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DAF1EABBE;
	Wed, 30 Oct 2024 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="l9Y8+XJf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46DE1E573E;
	Wed, 30 Oct 2024 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282145; cv=none; b=f5C1oOKz0UvmJndLcSfjR4cQmGEVaQNDRbEKxp1IbkFVcfMLrziWuq3SvQp55wPZ9vQT8t0oNFiG8jEVsFGaRGI7NQR8sC521eydBnf+nqbiYIRaVp82yUqlkp4oyd1bwlFJOxlAoSZF/c8Wafj4GRKdojA6Zycag7mPxoeGrYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282145; c=relaxed/simple;
	bh=gMC0AIiI/Y2DVK7hFH5y4phwR672FvvHc69yRw+0m/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9TyRa5rbQLW/IfBEGvOBGnQMmqB7XaT019yhphy2tE4jrXVkhm9PIu673rGFw36JQ++YAPZi+1g15YWsSZWzNReGeOzJ+QnSkQL/LKIOm/Hw7vwFyGBrMpUbwJunpD9gwgQHS0mRmAQhSRLiOxWbAxg0unXpiTEYw8Vn1+p9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=l9Y8+XJf; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B402D2A8ABF;
	Wed, 30 Oct 2024 10:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730282135;
	bh=gMC0AIiI/Y2DVK7hFH5y4phwR672FvvHc69yRw+0m/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l9Y8+XJfPeU4YrZn/iITWmNXxiGDKQc9qI1YRQlNIxSR9WumxuMkbyjgpbnyMkeNc
	 ZpvMFMOwCsn1RapHptt06thUPjJFkh44+dXEpEpDR1EkEf0Kl4DwpXawIXfAbmNRts
	 X63R4zz+B5UrrHYkv5a6NF3OQr+shqw3no07xjIksEN6S1sLX+KlH/PbooL+mR2bi5
	 mCU3WRDKz9hL+qgpaEX/7fIrDszVtauESl3Fv/cZH6HLx9d7pIgk1bl6c1oGUZK96m
	 yBkcjkzNUZpDlpxcqfg8cm6Cnu6KcLLwcOuaCo1N3vspd6UsoZzChLL1PdTwreFLvE
	 u3klQH+uJSSyw==
Date: Wed, 30 Oct 2024 10:55:34 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
	andersson@kernel.org, mathieu.poirier@linaro.org, hns@goldelico.com,
	b-padhi@ti.com, andreas@kemnade.info, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
Message-ID: <ZyIClriScBy4s6LX@8bytes.org>
References: <cover.1730136799.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>

On Mon, Oct 28, 2024 at 05:58:34PM +0000, Robin Murphy wrote:
> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.

My initial reflex would have been to just wipe the omap drivers,
hardware is 10+ years out of production, no? So who is still using this
hardware with recent kernels for other purposes than kernel testing?

> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.

I applied patches 3 and 4 to the ti/omap branch.

Regards,

	Joerg

