Return-Path: <linux-omap+bounces-2520-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFD99B640E
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 14:28:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DB5A283028
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 13:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866D51E7C2D;
	Wed, 30 Oct 2024 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM3oeQu9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F7522315;
	Wed, 30 Oct 2024 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730294905; cv=none; b=HtZhIrb7302K1T9Dx2JqgOuBk5kE2WzINXzPX1JVWLkNe5xD9E2YwPCo0ZzgEwaNTY6LayevGliE/qX5iDiRGBfaMsiuGggXOSEtjXWNXakwNW0sv522VWF1QFCrcdjdi/WMD30XQqUwi5QVDYIOTl6NWOEo5G/2GI5kVZ8nRPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730294905; c=relaxed/simple;
	bh=Co0lass6VxucvBFkw1aOnXJDq+FBmwMkMSrHRfwjdoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OK3eL/zOgvY+SUviKJyfMWTR2GylaoN1JTuwzBOgpEVKS2qwPcfNLeGj1nQpjfbfrIu0FNI8vkRnrt4AY1B6HT5IwP8RoyPiw04q8cohUCLviwnCCqIzHTHvEA92S+0qKLCWOmSWy0KsskFDWlsX9G2Be/xBtHA2zXsCoZ2MLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM3oeQu9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so61525285e9.2;
        Wed, 30 Oct 2024 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730294901; x=1730899701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bRYMDo31wli1+F5XqLgDNYu5RKLrQYurcKRy2ybtgM=;
        b=UM3oeQu9iWtFxn8R7Wyl8ciTk2frQtsV9TAbP8IwO10/NEIkDSypLRNUt9onP/0uNK
         YXa+BpCHZiivKH198+ZegoPIKaWMRVroGByoWbv39Ro67YSeBLzqOhFPspA507Gylx53
         TjeL7fMyw4U4rQMEmb6ymXNZGuKGJmOhpdbSPjQk/OO9Xjt4enF4BdpOzcXZyk1fX1FY
         q9Fsk9L8re1KmBF+7WXkQddbtyQ4wjhk/QVzWxhzNTFhkCylqKbbf/1sIh6jBhhe3nId
         YEZTY6QnZPw/YpMDMajhOn0ISSfLyotJ+Sss4KU+Eq8dhHSCZxVx51QzG4l+qiBCdoTz
         WXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294901; x=1730899701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bRYMDo31wli1+F5XqLgDNYu5RKLrQYurcKRy2ybtgM=;
        b=A1wV1YQ8J7NbvaIhic6HelDA3NRyD+vmWuWgPrQTxAnE/dsSprHymYqLd5fehfdDgG
         XLW5LZqg6h1neW779fXxzC9gwMT/DXw5tbkW91ay0yYtU1ZlIGfrryPo5QM5kViQhO2m
         Ewc7oQFdlQR3heuysI6O+uXSu5hzioyw0xbEa5uk8wwSegAjIyYJBVMpX8522B3hewee
         tEdjWEyItFiT3Xkn+zCtRohn/zplGKRTekMRWf2z2cXE+OcX04Y30YtVvwaxPY9erMZs
         bgPNNQFG5ePxvYS9N9QPSk7Ce08peBI/5j7Dw7kgPBIqpR686EvCBDsLm3UMQ0dmK3eD
         xpNA==
X-Forwarded-Encrypted: i=1; AJvYcCUNpesNCU9Abv5JgJ2wE0CKglCPgZhOgGEWfD3yrxjMgXQJmcx7ZAlDB8r2xPFod902vfrDjgJt+hYk26MvUb8TvQ==@vger.kernel.org, AJvYcCW0ZlYD0AXZhRnob7POHa0/Rpd1VqRxUgqIjbETYbAJzV6ih6rpqlmpS6rSvZHxEMdwLWRKs65DhMJ9rw==@vger.kernel.org, AJvYcCWU0MVJ2cB25WFYowj5Tex1Tl64g94DYdTwvmLgjGtJMDiZlSPnTqDSEnTv/acbFYPDhfiSSQgLZ3fLCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6WUhHUwZczINisTyepZAylSVNz+TV/jLJGU3MbMgBiUaVFdBh
	OCq6CqT+hDGVj+AUn/1epq3Q2M8PgnGOfoiiDHlslu0SOodENHyS
X-Google-Smtp-Source: AGHT+IF/oVv8150+7ro6yu0YdcKzcFPQ8lbfxvxtxQ1j2qTb6UYENnsCgQU3QxkyOYC63S92RRMIAg==
X-Received: by 2002:adf:ec8f:0:b0:374:b35e:ea6c with SMTP id ffacd0b85a97d-381b70ed1c3mr2289041f8f.40.1730294901291;
        Wed, 30 Oct 2024 06:28:21 -0700 (PDT)
Received: from tp440p.steeds.sam ([69.63.64.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b9294dsm15353345f8f.105.2024.10.30.06.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:28:20 -0700 (PDT)
Date: Wed, 30 Oct 2024 15:28:13 +0200
From: Sicelo <absicsz@gmail.com>
To: Joerg Roedel <joro@8bytes.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Robin Murphy <robin.murphy@arm.com>, will@kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	mchehab@kernel.org, andersson@kernel.org,
	mathieu.poirier@linaro.org, Beleswar Padhi <b-padhi@ti.com>,
	Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev,
	arm-soc <linux-arm-kernel@lists.infradead.org>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
Message-ID: <ZyI0baBMPHVZ29-k@tp440p.steeds.sam>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <ZyIClriScBy4s6LX@8bytes.org>
 <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
 <ZyIos2Gm1nf5rejI@8bytes.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyIos2Gm1nf5rejI@8bytes.org>

Hi

On Wed, Oct 30, 2024 at 01:38:11PM +0100, Joerg Roedel wrote:
> On Wed, Oct 30, 2024 at 12:20:31PM +0100, H. Nikolaus Schaller wrote:
> > Why that? There was a discussion and everyone agreed to remove omap2,
> > but not omap3 and later.
> 
> I raised this question to make sure the things we maintain are still
> relevant. Developer and maintainers time is limited and we should not
> spend it on stuff that nobody uses.
> 
> > There are some devices besides the PandaBoard. I am aware of these where
> > this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
> > (in production) and we are currently thinking about producing a tiny series
> > of the DM3730 based GTA04A5 with spare parts.
> > 
> > And of course we want to participate from the latest and greatest upstream changes.
> 
> Okay, if there are still real users for latest mainline kernels on this
> hardware, then the effort is justified.
> 
> Regards,
> 
> 	Joerg

There is also the Nokia N900 phone (OMAP3) still seeing mainline
activity, as well as the Motorola Droid 4 (OMAP4), to name a few. I will
also be testing on the N900 around the weekend.

Thanks to everyone for the amazing work.

Sincerely
Sicelo

