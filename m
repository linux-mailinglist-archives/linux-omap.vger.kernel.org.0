Return-Path: <linux-omap+bounces-4586-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6143AB46694
	for <lists+linux-omap@lfdr.de>; Sat,  6 Sep 2025 00:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D83EE58378A
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 22:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E850288531;
	Fri,  5 Sep 2025 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JRpQGtsL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B5284B50
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 22:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757110935; cv=none; b=ckSrFZbXL9pJkr0iW8mohubrxwnq+M7U7jqA0j/esQVO3M2LbsCcwgbgKha7vLvsufsco1x52BhA6wu3nJSsP7Nl5Ucj2IRajUJIYTnCY7ukQYpmRQOIZUyq+iQGooxzBHST4WvB/sQrD4XmRmUI0qvCr93TlUDsLmwr2+ilrEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757110935; c=relaxed/simple;
	bh=jn+MZ5+d97lgrG+nL2EHugJJgZgp2bHPyDe+yYWp08k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oUhXddALrkx87c2eWw3jh+DtubsJDJeMaiEV95EcDyCRouoj3xuKZ3MiPer8YnV1CF4xhO/y3BNGKqSWQ8+Pg5tYnm22DdqaVXYXgXWXRPkqR+Bh8uZJ3+937ujCVw8bwSn4RjxWnNLR/QkoVk4GuhsHdAe9ANdouVAlVllwoao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JRpQGtsL; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77256e75eacso2432778b3a.0
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 15:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757110933; x=1757715733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHO3loFaMTLM8uFwv63bYVveAEYQx6NyvCeDA98Eah4=;
        b=JRpQGtsLRA1eMOq4JaVIyk4mcM/BmTzW0MKOG0F/6ylDwpjfdaVZ5OH0rteKrRWASf
         oTE+v8+uHd7joQyEiaaiOWLu41eEbgSFA4eiBMb7WH3+O7YbeGjhafD60dreKBAOWNAg
         JIllxR9QUjLCcmDOeGlNWVWjKF5hD53DeSyw2JTXGWzydalTvPrSxJfLb1xpex+8nI6Z
         uepsRh3Rk//6L262YEngz4RvF34d+A20Vlqw0LqL7+JHvcHRzUibLAm/IJbQwPf5R8vu
         kV07izRDFsIi537dQ+bnXeyOWvS8F8lAh3rGoS68K2UAm03TrFedFSgiZdNcCnfzbSBK
         qFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757110933; x=1757715733;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UHO3loFaMTLM8uFwv63bYVveAEYQx6NyvCeDA98Eah4=;
        b=v/w0FS4Mcu8cjqZd7seQdZqPvwrDGK70CxAqaNKSkT2PModrX+KS+/6Ww4NjsiuoIZ
         J0mGye0mx/bc4eKyywt+4bNhaxkSBoLD4neU56vCvc4i/LvU49Gvi0srM2r5TaQZ83KW
         nbfxwoO9W5AeDy8JGwzuVpR3SuvI46kjH9nxdarVg86Pl9KoGhK8FLoTy2ix/ifEmtKh
         68Fq1EXmpmCw0CXC4lUZp+MoJSR8GtzI6Iii31MXtGFcxHGjqjJsn2jRwYlGE739jWE2
         lq8icmqc40KMM4gQi5EbykS6QSmG1pwmpfqirQGPw+ev7lgwngvpBRRVramrGqXyHDlW
         BsMg==
X-Gm-Message-State: AOJu0Yyphzy/fsrknKVj2rlsAAXeRZQ2jOeQU7PzapCv6o0jJgozDA0u
	QSFvQVmzUifemoH09sVUYMADSe+P+PnY+gVZdHZfsez8gCf56q3D0/LrsvoI7uVPvrg=
X-Gm-Gg: ASbGncuB5kqyAPhrwJbvowZhqllxhGhfhpR10ljsbFUJAuIhXUy4FMVys187KiNZ6ao
	oBLsfjpjxjOxDLPNd8aTJTHXx4ZUHkOXSW9yQauQdIZ6p83Zg0fsc1IGMWVSBuOTuRHF8xoav5q
	XZyw6c3GlJQG34mEeQr5KvP32Wckk8da1BM8ezJRcD4/j4B3uQgEaAGMRmBs1WNLBLPsf6avpN1
	eFmwEBszDtdNKMWojXhP8F+zbAYm8wr6xE51nZD1PChThjLxy1rU7IV0SlveqjJ6bs6HIyYJoi0
	fDf5abHZe2/MLUrFnBygliyjcDob6L1SXdtFY76kslPv3gWeooaH1yaviEhke3h3vfkIhRPOrDg
	vmnztH8NPIMm5nCZ8PKNtmYbSnr9NdNU=
X-Google-Smtp-Source: AGHT+IHbdxqjETLKCIYsM+vvWTUBcu92bCBkA6QMHPw45DcnfwpGvkag6fr4ck8750NnNpRjOpQxSQ==
X-Received: by 2002:a05:6a20:a11e:b0:249:3006:7578 with SMTP id adf61e73a8af0-2534338b099mr567181637.36.1757110932917;
        Fri, 05 Sep 2025 15:22:12 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b7d10sm23116992b3a.33.2025.09.05.15.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 15:22:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20250721173741.6369-1-bruno.thomsen@gmail.com>
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
Subject: Re: [PATCH] ARM: dts: am33xx-l4: fix UART compatible
Message-Id: <175711093199.666031.10782227973545303080.b4-ty@baylibre.com>
Date: Fri, 05 Sep 2025 15:22:12 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Mon, 21 Jul 2025 19:37:41 +0200, Bruno Thomsen wrote:
> Fixes the following dtschema check warning:
> 
> serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> 	['ti,am3352-uart', 'ti,omap3-uart'] is too long
> 	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> 	'ti,am654-uart' was expected
> 	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am33xx-l4: fix UART compatible
      commit: ca8be8fc2c306efb090791835acfb5b33542ca1d

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


