Return-Path: <linux-omap+bounces-2553-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 900639B78D7
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 11:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2523B24113
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 10:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C69199939;
	Thu, 31 Oct 2024 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWDERBAv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB31953A2;
	Thu, 31 Oct 2024 10:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371316; cv=none; b=INgEIhL8w0DWcZIKF3OzpSFGgM0T/9httRsCARgOboN2q6hTVSu5PmNZPem/5fmQVIXVMrZ29tXIdEq/o1PIncdoaKIWIFIqarc542vE0bdr9d8xOf41/HP9/4A6avt2lKwNqtWlu/2jcV7y0J5iamnFpCAX98JD8g0diA6v8bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371316; c=relaxed/simple;
	bh=q2m+OHJQe9VEbpZccvcxyWYrsG45lMP+Rd3vJL1KHms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkEhXis1RbKvlXm/XVt+4DGczv21uDuSo/7j/UT8ARTcqaU4tlYwJ0oaeA2KUnggkCyJYJMgWn2653NJlUDybVp2JKHGst9ApXVQA+EeCjKvlfPYZr6s/VSl9flP7f2sJ/dJN2l2/IPMq2/9zci+8wgQBhp/ZXIhxZcrNR2HiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWDERBAv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20e6981ca77so8681045ad.2;
        Thu, 31 Oct 2024 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730371314; x=1730976114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5GNro7YWC/FjezeaKCH9xRHgSznLSEnftFlQE0TrdM=;
        b=lWDERBAvcs16YHCtTdnWtu75E+sGf/YxzaJRFbEpZ5rma/jsYxaKsNHEIhNtXzbPFL
         YgtvorLaxziu6Gx4YyFq3pm3TFLURiVzhnWVZFL68Pa35PNdrWujaIJg5rvFYsOy4Gje
         08T1k9yh6B3NtY8mL3XMMf95wKPbctd5+kKfN6BR9IKs1ytmCjZ0itvnYlJh9MXC6Nfv
         G3/lziIP75xqBQ/bnWPfkVh9RqzA+Zq3kF+8yjB12pNOd/vyKY+HhOHHg/87HC+ISwWQ
         2dvPabZayxQ4AN7BNDVUMXglFzsJWZQgf72FAssCxV9xGv7c2kO1yBuI78xbPy0Yfvyc
         yMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371314; x=1730976114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5GNro7YWC/FjezeaKCH9xRHgSznLSEnftFlQE0TrdM=;
        b=GiwA6xs21Sh8MdUYRFCXizuGwGBGvinC8QjTRMbmMpJsNewMgRDHC5sjNz//JELR/D
         KpiZujG5QXq9Yin6MRYoa8D/kCOhHgQ6afpjpgvjFDhPHFNj1/b+Nhr47c+R3iaDqq5g
         pw63SnMH66mECIIH9dKNIn3XOTUQTYAOx2Ot/s1N0RnSnV24qv2ikgT1/OQ2PVu+kDFD
         QoYZANtCwJHRtuuvBgVgiENKx545vqPnyCMKqSxMBmxpID5RgKx9GggRXKjdd+QBtbZi
         Hb2LU58q7WzlSr4YFj6qtmunDwHqAL/clRC31zxZeWYvhUEV7cKNjoiSjdLPPU4BnYSp
         yeUw==
X-Forwarded-Encrypted: i=1; AJvYcCUKVn6v4bbThuXYQPc/dpzXPKZFbqWY2++X1FfbHvGqFRucND+aqSFY9WL/18MBc3LphYpEy0UlZkSRjw==@vger.kernel.org, AJvYcCVQHJ9Z3hhhT9hY0lywcWSsiLLaE131Aa3nMscodGyCstDgAJ41dLs6N6EfsieQTpPOaGGCGMedVC9qZnTN@vger.kernel.org, AJvYcCVqOSlJgyo3gRVLyhtMO1tlHSpuf4yyb2DPq8+NWnnUxTxXdkqsLwC+T9zAnq1qXS59R6KEPstNvB8Q@vger.kernel.org, AJvYcCXTfzmcbnD9aEJnDUkmT4Qmw+Ehf9qBQijvbVRQ8Ulk62kQGmONR02TIXRkdDSzDyAb6gOCdEKozsV40NmMs4le@vger.kernel.org
X-Gm-Message-State: AOJu0YzF4y+78KoqAFz4PLj8ckOCgwToecB6oOxauGDQI7HOcDylmnVG
	6hTGIjj342bOIFlZiBouGnKdbqbR2yi67wNB32fsNmgl5QPxXc5Z
X-Google-Smtp-Source: AGHT+IFxKgky6EqyTOIn7AIkk0TZ6xVCr1/Y3di4h7lNHH2Vcs437U3ctPeYZl6ScCv0XhCeKnA8vA==
X-Received: by 2002:a17:902:ea04:b0:20c:f9ec:cd9e with SMTP id d9443c01a7336-21103c59c36mr32515255ad.41.1730371313557;
        Thu, 31 Oct 2024 03:41:53 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed995sm7067045ad.39.2024.10.31.03.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 03:41:52 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: aaro.koskinen@iki.fi,
	bavishimithil@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	tony@atomide.com
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
Date: Thu, 31 Oct 2024 10:41:45 +0000
Message-ID: <20241031104146.4538-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241031083248.043d25d0@akair>
References: <20241031083248.043d25d0@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> well, that takes time, I wanted to start that on the right thing.

Yes indeed, I'll be more careful the next time, again sorry for the 
trouble, I am not used to the process of mailing lists and may have done
some mistakes there as well.

> 1. make dtbs shows warnings

> 2. make CHECK_DTBS=y ti/omap/omap4-samsung-espresso7.dtb is too noisy
> (probably same for espresso10).

> a lot comes from the dtsi files, so you need to ignore a lot, probably
> either strip down the new dts to almost nothing besides dtsi includes
> to determine the background noise or take a similar device, redirect
> output and errors, diff that output with the full devicetree.
> I am trying to clean that dtsi warning mess up, linux-next shows a lot
> less warnings but that takes time.

Oh, I was not aware of such tool, ran it and yeah there are a ton of
warnings, where can I ask for assitance if I need it while fixing them.

> One of the warnings that should be fixed:
> dts/ti/omap/omap4-samsung-espresso7.dtb: lvds-encoder: compatible:
> 'oneOf' conditional failed, one must be fixed: ['lvds-encoder'] is too
> short 'lvds-encoder' is not one of ['ti,ds90c185', 'ti,ds90c187',
> 'ti,sn75lvds83'] 'lvds-encoder' is not one of ['ti,ds90cf364a',
> 'ti,ds90cf384a', 'ti,sn65lvds94'] 'lvds-encoder' is not one of
> ['thine,thc63lvdm83d'] from schema $id:
> 	http://devicetree.org/schemas/display/bridge/lvds-codec.yaml

Ah right, I have to add the encoder (doestek, dtc34lm85am) in bindings and
in vendor, this patchset may grow too big I assume.

Best Regards,
Mithil

