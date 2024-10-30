Return-Path: <linux-omap+bounces-2518-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC89B6330
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 13:38:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A9E1F21BD5
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 12:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232931E3DF3;
	Wed, 30 Oct 2024 12:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="Da0ZS4pW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7500E1E4AE;
	Wed, 30 Oct 2024 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730291896; cv=none; b=tNVZ7wqqZzZqdLPgbPyVQlGpJFUbopXIqtpMrdxx4Mrsc7jc8bc8uBEOT/xvTWkzzBVcKCP8tN0ezzuDhYBnzyjh/TSrGTSFJ0WEGPz3KX7JCHe60cnEGlbcRZLo6NO/08fTXLRGte09SSRNT/eRe+OCGlvVxMrgegr19rDzuuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730291896; c=relaxed/simple;
	bh=J7nmzRywj0qaO/1WPiCgBt1ut1D+D819BCVlsTvDaw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7vPNY8ph2Zoy4iDv05Rm8p09SjsKpGRow0R6FTIyIoDAFQbHrg2wFINwS+rIIXsEPNbdRqmBDmMs5ERxanrBQ9wDgSgetbggh+Nmw3ZT5BBDY/5nWOCv0GZPfW61xulMHKeCOkPcr/EAUI2yxxHFQOjmkEKHScmc83AQkofcRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=Da0ZS4pW; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p549219d2.dip0.t-ipconnect.de [84.146.25.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 198532A83AF;
	Wed, 30 Oct 2024 13:38:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1730291893;
	bh=J7nmzRywj0qaO/1WPiCgBt1ut1D+D819BCVlsTvDaw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Da0ZS4pWlvbjgdzVD+fdk8Jzd/jG1ijiGPVkptR5cSluYwQ3JTkOqLI4YvaPI2weg
	 D0hPr37s26QLkDzN+GaObVj5QgjnldMcaKj+8wamC1UCOcSpDYLxZARhb67DxO7sPE
	 1/JxKf89DReDfxm/Zg/ccTAR/+92MHey6IDPKX2qjJts9WZZul9wkKmITAmc5HfBpd
	 rDGHBeXeqeGJAzLgr3I7VdBfEgNdNzjMHi3I5zFOnLSUWIpZX1rsHD5vXUhpUwcaBs
	 dT3ywAnZM9T7FeymcLPcixf3mpaG+cnx2bNEZpynXwmGeN8OyheysJ4J3CZm2Opwum
	 ncCrvoMn1T87g==
Date: Wed, 30 Oct 2024 13:38:11 +0100
From: Joerg Roedel <joro@8bytes.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, Beleswar Padhi <b-padhi@ti.com>,
	Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
Message-ID: <ZyIos2Gm1nf5rejI@8bytes.org>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <ZyIClriScBy4s6LX@8bytes.org>
 <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>

On Wed, Oct 30, 2024 at 12:20:31PM +0100, H. Nikolaus Schaller wrote:
> Why that? There was a discussion and everyone agreed to remove omap2,
> but not omap3 and later.

I raised this question to make sure the things we maintain are still
relevant. Developer and maintainers time is limited and we should not
spend it on stuff that nobody uses.

> There are some devices besides the PandaBoard. I am aware of these where
> this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
> (in production) and we are currently thinking about producing a tiny series
> of the DM3730 based GTA04A5 with spare parts.
> 
> And of course we want to participate from the latest and greatest upstream changes.

Okay, if there are still real users for latest mainline kernels on this
hardware, then the effort is justified.

Regards,

	Joerg

