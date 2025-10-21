Return-Path: <linux-omap+bounces-4734-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF18BF8005
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 19:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F8744ED242
	for <lists+linux-omap@lfdr.de>; Tue, 21 Oct 2025 17:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F59B34E758;
	Tue, 21 Oct 2025 17:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0wtJmlO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E77734D4CE
	for <linux-omap@vger.kernel.org>; Tue, 21 Oct 2025 17:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761069520; cv=none; b=MV/nH57Y5RsTvN1E3wLKPUl9zN0stmjGtBVTyrIqYLEStkUcDp5M0qj4r9ihNiktPybmb8c0F07FOA6vhUgd4FsnuHrwZWi4+PAd7qZb9DMauS40Lp6c+dy8Zi3b7IGGJot5Jg0ugRBugFBawqaTIN0DRP4bvVfCGaD9GC5RHEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761069520; c=relaxed/simple;
	bh=oVng6fWpL6+zAcowBglyuHt/XIthmz+mN+6mXhWfgns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAfeMUTAUa3SUx5svpH5+YfHHhlQQyOBiWZDJ1233cJH77BACA6oRWrIho3/38rX1kQMVBUSKFRnHbLr4DaMpT6eB+ujK+42G3JlXnwo3pNIChdCLX6+fhXLwwfkyCLiON9CDdtAe0OXLyvbWZxFugNHZ4/nyLLPYIhOHauFRyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0wtJmlO; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781010ff051so4395345b3a.0
        for <linux-omap@vger.kernel.org>; Tue, 21 Oct 2025 10:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761069519; x=1761674319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WrSVEkanyR2raSWr6Z5enbATkDaqZXlpz9bzA6mqOvo=;
        b=W0wtJmlOUkEuSXcABm36IicjC1uVQ23JTFm/RJUGDAd+cr2T21rMwbOkNdmrWPz02r
         nnEL/iN3hvdehB9QTvdP5C6MgYlIn5iyR9qB2MYoZVz40T9UxT/zEeSMFwRYWQaQUZU5
         +7mskIfCrigsGeYVJeuyAOqBweWRfGtvXtQ94jemhPt65DY/AErpNYX+HN7Ad72pZwRD
         /YhJXdtuekO6vUIGkJdBI+kMW0gkS0But1ZEEnCv2+rYwah7jTIGksSAD49KBw1W5dzI
         l+nMowBhFQkw78pYzicRvC6gODSU1/UCN+G5Jh3hNSqUzlffTLEyuK5KRwrQmfLm26Gg
         TZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761069519; x=1761674319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WrSVEkanyR2raSWr6Z5enbATkDaqZXlpz9bzA6mqOvo=;
        b=rj2LF8UILYRScwHgaqpfgCvCYkzg72uHzzhXzt8DiSqjkTp6ODT6giiWO45S+jgybI
         jrq81cc7qUd7vvcHUWLlnf2ieAFqNZFnd/CvCVUBRQJxevvtSUIL2eShWDUE3MdD3AMq
         ax+FN135rLfG9Lpl++VpTutJdcU0+uj35H78VGP3mMxLukdbDmADchxJDCw4tous173W
         +MgyrHQkZxJUUI9x2faK6SwoahJu7HTOJnz6Rolic5tQBj74TIIlKX0YhflIH2f8iJf7
         RkBPuk5kggUMfVfQ8htXi+dWq9/XpOwPpCgk2USEOgJ63wwFotAcHeR0RKSvBsRGO+BG
         E3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8i+tOD5VOlFouq+3Vf4TReIXTtFzfgQVM1Um3smPwsFpzU8eUPi3ayPuYunOf6tii8Cx8xnvSMKQY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FsoeGxU8xYpL1u23KtOWBdaNRWHqXokhKfHQaGwkdG98w/aY
	IDaAEMU4j9aXyX8fRmzCh2QhNIZAHP4ujrWV2xTCCnd2UW6uNVo9LdAs
X-Gm-Gg: ASbGncvVbh3d42hOCQ8GrVzbDnPQgcTFClFwu6SS4TyfY6XvR25EG2Y9fEI2ihRI05i
	mREWC1RNS4niX5AwDQHjTCGhgcc0V5LCfEGiyXnaPm9hmKgppANz/ZtcJRUCgHlDEmZ3FxjjraW
	4rDKiXM2mq1RSzS+E3nCscMIa9yv/cXAw/xbqmQoErsLPrYnj7A9Yc9nxlmjcnI19CkQllCK8t/
	EMJxEvPqYia+Z6YSccfsJIbikQ3Rn9YJ9e2JTSxicBpBmkhKe57LuD1lgo9khE7FFyv15hsmNn2
	BKm41ZGPZzxD2Qw5tB/Kipjw0LvMY1bQHeyk3aHf2a1ssd3bAi+adfPGY2P1yZWwMPZsoKxSl/4
	ANlcQo/D3HD3VEUZ30ubNx0bsawnYjA00FwDrxrSTLb5If6IX2bihEA7LYRVjmc8mTwUlX17X6S
	DNVKdVm7Zww3Wf+KFiRHRPowbu8hZF4rcRBzq2dHL+
X-Google-Smtp-Source: AGHT+IG1/8RQi0Z/qvWdJQ+g6q3+RnnFcN/xD+n+8yNjkNb6lOorDEZJv4LXW+vDN+NpEpk2xHxl0Q==
X-Received: by 2002:a05:6a20:9392:b0:334:942a:daa8 with SMTP id adf61e73a8af0-334a8622b2emr21456240637.50.1761069518621;
        Tue, 21 Oct 2025 10:58:38 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:bf44:8af2:4f63:3654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010df2asm11941146b3a.64.2025.10.21.10.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 10:58:38 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:58:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: add TWL603x power button
Message-ID: <aalnnbzeajxgnq33go5b2gi72yjzeeun5f2pkbdulu2hwuz663@b65xssnkse7l>
References: <20251020-twl6030-button-v1-0-93e4644ac974@kernel.org>
 <20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-twl6030-button-v1-2-93e4644ac974@kernel.org>

On Mon, Oct 20, 2025 at 02:31:59PM +0200, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so add
> a driver for it.

Could it be integrated into twl4030-pwrbutton.c? I think the differences
can be accounted for via a "chip" structure attached to a compatible...

Thanks.

-- 
Dmitry

