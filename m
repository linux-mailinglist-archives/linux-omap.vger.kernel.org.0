Return-Path: <linux-omap+bounces-1528-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FFF9067B9
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 10:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4967C288F2C
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1ED1442E8;
	Thu, 13 Jun 2024 08:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLZwrR9g"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8256137936;
	Thu, 13 Jun 2024 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268567; cv=none; b=WOLQFt60NG+LNrK2wvHuHJWpjLD+N4ZZ4S4Rp3m40BwnUcV985o2ffmHF6ciKInJzOJbmD5mnxg/m44pvbi/9iZaiFIjVw5BPO7UYP2L90EheIax2D0OYpJBQDigj5Gz3xqkCEzKWCy6Wtlqi1r2iXxDyYeC0KCIzz3YQ9Sif0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268567; c=relaxed/simple;
	bh=V77qM3lxWLpzjNjhIKYIFnAbpVbP/tQaTtykD1SSvyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obceUVMNvK6U6AXYrJN1jEJaiebtZGlk8gw3f2JO98eB78r4bj3v4qOuWUtH2ufH48ivu/5gZfCHzjwuVXFBw3W51yFbUjjviCP1D7U46FdgHdXWK9zAHdxZa2l6ZmgGiDFdyo8arVCYka6cDtgc4+Gd/6U6spsYXg4t7Ql1O7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLZwrR9g; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5295eb47b48so983763e87.1;
        Thu, 13 Jun 2024 01:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718268564; x=1718873364; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uoDG9jwFOreQjfWAEuHsfW2t7wLkR7xBn+RC3C/5v8o=;
        b=mLZwrR9g5WRlTnxcYHTX75L1C34xl5bkpA0KLAKEbaRlVVoSGgtoa6ydMwUVt+R6jC
         YD2U6sV3q25FBag5SSGaEewbQK+0DSsxgG4yCmtfoaC+l2TsYT4S3M/liPhyduVVyRJG
         /84pCz4mJmgiO/8kTCmAn3McnXjSYBREQ6cpFsJkX/gpo9gByjtAp1dPwr3NXeW4GPrp
         VgKY5vwrk9mrXPkhp+MVJSUZB4D7ZXJUqCG9VIkGfq102ZB2LWgRGAQ+D1+VqLTf2Unk
         D6UwvJPfo8iuecul+vDOTbiAqQ7wCeqo3uFaDB8Rhbgmz7iJ3UBfHq7kU/wymCkJMBal
         ZsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718268564; x=1718873364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoDG9jwFOreQjfWAEuHsfW2t7wLkR7xBn+RC3C/5v8o=;
        b=L1UyS6Hvp/hB/ipYx2gFQHkPLAQ5F+XIpZsuQltHgzn9DimAlSz7KG9wGHJKuxynmZ
         Pv31PhGiYOBisnnRkvwR3Da/sPMwMZ2AIVEECnk5NNiJGMYGbOA5Ra5b9+VET5cfwMaP
         nweUVvWr8WA2nDJpXugIpXcCYBwMnJrtiW1ClTYPkYJrUu31DJ8WNzVWZuh8rjzjGXBZ
         89IZRH5iCRWOx9Rx7cJF2ns3DlTjZKDuSpAdG/be46x7YphzbrscE/Qa9Acrhl7gwj57
         SQdpxK5XCIEEZFt4GccK1YkiQKwdQxxaPMlKGMC67/39PPH7ZxnhbukbGSfjuk7gBYUQ
         d8rg==
X-Forwarded-Encrypted: i=1; AJvYcCXEEC+S11coSV2WZ7MtTqasSO2QL1uXfrHTOMqhEeCqgO+9kJmQQmEq3SqoTeWnwezu/Mp+Ug/CHibrSXdA6hNSjmfve/pVYdDytahIowqY42mQWlRr85XPBjLsHXaiN9ArY5mil/bO5sYa15J2Uywje0TkM/8WBhBJDcyYcQ9u5F/wBj8=
X-Gm-Message-State: AOJu0YywmY7BJjZxMeUSwc3uIIAYq3aUKApdb1mriVHgfK/KzGldWvFO
	HehBcFLhghF91a6sr3dFcmDZzJpaF4E0KKg0V7rrgNUCXRn4cBTx2MF41tydx8o6SyMJ3Buw2Zg
	CtUetCw9+JFGfyA7YLFMFcPaWf2FKK4pHCLQ=
X-Google-Smtp-Source: AGHT+IFQZFInh9533tDGNNq6304YQpb3saj0ciadIrVCmk8e0c0IRkqJbPMoMoITnTbKej0XwWqtJ6MvS47su09JT0w=
X-Received: by 2002:a05:6512:108e:b0:52c:7f12:61d1 with SMTP id
 2adb3069b0e04-52c9a3b972dmr3524638e87.1.1718268563795; Thu, 13 Jun 2024
 01:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611132134.31269-1-bavishimithil@gmail.com>
 <20240611164951.51754ffc@aktux> <CAGzNGRmoSawz7yHGzHS8PeQwRAsnnORLMPrrNBLupNdaOkUeHw@mail.gmail.com>
 <CAGzNGRnnZWJP6CF1X6SXus2QCwUA763=qHUAy6c6Ny6_FFd7GQ@mail.gmail.com>
In-Reply-To: <CAGzNGRnnZWJP6CF1X6SXus2QCwUA763=qHUAy6c6Ny6_FFd7GQ@mail.gmail.com>
From: Mithil <bavishimithil@gmail.com>
Date: Thu, 13 Jun 2024 14:19:12 +0530
Message-ID: <CAGzNGRk3dwGEsQbrN4LZfKwDGTncHpKEcf2cLepUkRYBO4yn5Q@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
To: Andreas Kemnade <andreas@kemnade.info>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

https://github.com/MightyM17/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-pmic.c#L446-L455
Should we map it accordingly? Like vaux1: regulator-vaux1 and
compatible has ldo1, or should we call the node ldo1 as well?
-- 
Best Regards,
Mithil

