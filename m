Return-Path: <linux-omap+bounces-2512-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7EB9B5853
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 01:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD5881C22AC8
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 00:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C2CB13FEE;
	Wed, 30 Oct 2024 00:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ycniE6Fh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EC21FB4
	for <linux-omap@vger.kernel.org>; Wed, 30 Oct 2024 00:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730247029; cv=none; b=mCvZRExUE/Eup5e6Qv7Yh+eHqYc15n6BJ+FZAsT9CMlkWnEP2b/Oc+FMFKSD9Dex2n7vd0VdaYM/Ocfk7N4BoQjEvRaGBsp9+k+6mo1gK8C2usXKn+uXJ/Oequ5oxcMarMB46qe8FjZQRouKMmofzApHBpPlJ1qKRLMvyMPp/Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730247029; c=relaxed/simple;
	bh=zYsGfe1kZFBMeiGdhUwqicj9fZZIGo5QoZwVvvTXXP4=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bvXYoYIzacq41pZkudcLmxzR5EyIUbMWXsAGtCWPnlTzIBDKKleOvIVLxRHh0Aian3CybQXtoSnhE68HWNGSP1DH9/28043FlvLGHU+quM+KWXVUVnI9qxZZ4iKcI3Xd5Vvq5i1Yy5zmdtx7ITlijKe28KJke1rJq+Q5/VYEfsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ycniE6Fh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e2e88cb0bbso4664631a91.3
        for <linux-omap@vger.kernel.org>; Tue, 29 Oct 2024 17:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730247026; x=1730851826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pmtq/3EE6GjAiWTciWb2wYikOcfKtyFxI4NJtsXKhOs=;
        b=ycniE6FhnR+ZajIKk9NCfOBO/guud0K7MOQXym3WJfkdrKigjbqxHmolfrIkk7yZe5
         kbmWOA/iJamYADQECeetAaT27JHSEO2usM7N/iUbE/WQMNUNmDx1tidMqxcdKeP13v49
         c4yQQ4dhGaqY5YGWi/3TehKycxpcsZ8H5gDYNVl5ZAORDuljOnC0YZSjRDe7+VtT8vRd
         zyLAAGSKg2opvTlTVTbxPFa0e4SorJGBTNF5VCvtW/Z7c3GRdoFcasXnfvSEHDnb/zez
         5wIt1ODKQp7h05s8iW+cNFsajGHMEfAXQ72/xYiQtkpyzFMY1cOrE5fdFlsHuxb93pGr
         9dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730247026; x=1730851826;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pmtq/3EE6GjAiWTciWb2wYikOcfKtyFxI4NJtsXKhOs=;
        b=aAUZuufYwRrWzdPThZhq0s7vlMoY3bpp7a4r6hObbF/45jdJbeyWyFf5maY9edtiQP
         IdakwipABPWGMQGzjIhYWbOuDmNRJoIemX66cm5YQbeVsuyTxQsJ9ZusgNb+gO1MerYp
         wwP/dA++Ezw2HQtNkE4k4XAUNnFhgp0YWdP9PYrUe0v8ARUxAR3e8bNI7BrKKDROyg80
         Yhaos76hVaPtfEIJEi2q+wjec9Oy8F9fFY7eBJVlmsxc/kc4AAU8URlL53UewuupN/60
         /UOpXubgvB6WG+IFfS9GzPuN9rXDXolQuedTpdZ9mSbG2gsG9Po+PpBIoRgBF8TMrlkx
         G5rw==
X-Forwarded-Encrypted: i=1; AJvYcCXv7EiNjN2scHOPpVew4uc97J6O2vtwcmsqdVLKDHUj2l0/gX8OGDdxiOmKJzkDLpISIzHPt05TWW7P@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvDUYbGu7Kn9QtgHksLXcR1DjilQ31G/c1kS5fQSRLxylnY2B
	fCFH9GpcGbRz7yiChoi5bDMiC0rJlMzgTAFXxnKNFs6IYS5qgGVxY0eLFGEamk0=
X-Google-Smtp-Source: AGHT+IGe+0wqPyiUIokgz/5CRPtLXJj7VeshgbK754z1j+tqbLtUEbbHozEAedadsH1Xf0UUpjEl3A==
X-Received: by 2002:a17:90b:3848:b0:2e0:5748:6ea1 with SMTP id 98e67ed59e1d1-2e8f11dcec5mr15615895a91.37.1730247026503;
        Tue, 29 Oct 2024 17:10:26 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa5f70fsm285345a91.33.2024.10.29.17.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 17:10:25 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi, 
 Roger Quadros <rogerq@kernel.org>, Andreas Kemnade <andreas@kemnade.info>
In-Reply-To: <20241019111121.331477-1-andreas@kemnade.info>
References: <20241019111121.331477-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
Message-Id: <173024702514.1375433.8282990784679677297.b4-ty@baylibre.com>
Date: Tue, 29 Oct 2024 17:10:25 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Sat, 19 Oct 2024 13:11:21 +0200, Andreas Kemnade wrote:
> Add charger and battery definition for the Epson Moverio BT-200 to make
> charging working.
> 
> 

Applied, thanks!

[1/1] ARM: dts: ti/omap: omap4-epson-embt2ws: add charger
      commit: a2c06140b92a0fde8587e7a413014701cf121836

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


