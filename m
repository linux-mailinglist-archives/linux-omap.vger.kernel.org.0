Return-Path: <linux-omap+bounces-3576-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE93A85098
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 02:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FFA03BDFC4
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 00:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76CEC2D1;
	Fri, 11 Apr 2025 00:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zbcrWb36"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D924C92
	for <linux-omap@vger.kernel.org>; Fri, 11 Apr 2025 00:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331942; cv=none; b=fGNJDwVJ8wemT0hviEgBiAun2w8IGT4YgnRJ4a7+7EeqVNq/4ZxpFx6pXkaGTKsN0WNCBYKIqdrE9Rl/A8YvPT916CADfDptn4brcX5rza7MQoEnppfetDIO2XLX2RrDepVux9AR2w6owfuUL++t+FijjBuH2TU69D4zmL2y/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331942; c=relaxed/simple;
	bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=slFUy3ylHpN2MPdqt/YbmEbjfbYvMnlhDEPgqKUQMWhwCwbQ4cKa5USD2QJbfaWn3Kv9DXOXTN+89aY6zwn5Rm+t2nVLxIcyjQyPpaTHI01AXwmDU/XIjaL7PaYCTT3Cs/jS+emhI0o8oDG97FG6c6YtRDPTZ9ccDMBLPTV2tY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zbcrWb36; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736c3e7b390so1350988b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 10 Apr 2025 17:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744331940; x=1744936740; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
        b=zbcrWb36cOskvr/Uzp6OZmRd1No8pPYrsWD5NUFet671YZrG5nbONkJvmcupPK4VYA
         hxBQFstZuFiMNnq1JQUF1FWSiS+8V7rnBPwH3JrTed2A2/9xOoxN9xJqm1HqV3tV3LyQ
         pYv2yboDCJw76Wxa7BJDyvsPE1ty5zuJNgBHAdhsEwxK9VqHiGEFvRafzZLjTkHjYB/b
         Q+OFHOXv3C+Q7V/UPtr2XZJzzsad9OiHbPdsjba9FCdYqgbWQAZTC/tTkHSbZ115Gm2C
         AzPY7uYaW5T/+Fs7J5zQuACzpJYz//oqYOTERDnybBRN/ErhkP0bt5mZ0qHDTi1BOSRf
         mITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331940; x=1744936740;
        h=mime-version:message-id:date:references:in-reply-to:subject:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+5YsoHQ8CSMxUeDudniraau5fmGGTFuPzw0XxUxa5Sw=;
        b=pxftPs87im+j8OIeAEnAzqJLfjTF9ox+DUxS65eCn6C1gn0vkc6g+hfuqcrpKYrzYj
         Hme/ZquDCfuYfnYXc35mXtU8NClwRe1S5CQzRJlxhsB1SjkDSMMftT9eCs4dJtfuLIHE
         bDMWjaWez8FHRA+VYEALX0xnOXwob06Lk/g3KXX3FGt0GAmuW5RxE5nJZHTo2iat3tgK
         F5h1beOLrDK8K2oCOW3rrB6BptfwrjJKFB0BZQX3iqQqKn4hHTL49pi5ItHwegEF6Uuz
         VP23+3DZhbTecAaz4PrD1/GQpJycnJXCAH+VJ9SAk5f8uvSlFMsvC/hhM07+d5X4/MVW
         qu3w==
X-Forwarded-Encrypted: i=1; AJvYcCWT5kEkf3b7Fm6NME562KLy0gT1AsQHzwCtWbaQpkzn6nmERxjc40f+Oqfv99Uzz2cCpfQALc2Bt7Lv@vger.kernel.org
X-Gm-Message-State: AOJu0YyevyFlneYKD4K42MpaRZRdwHD1SOX4yfZmwErXkfjq/lOpsaUd
	D6WODgpfOmRBSFEep8ufQ7+8bAP9RgYJKOGaihttuY+zuWBphy+yVH3AixwxI7Q=
X-Gm-Gg: ASbGncuMUQTAOEmQKKXtpiHjGM3G92I6nwseYIthReBG5uWnCNeD88+Zhkl+NfVjKng
	i19+xYQLZqFwAZKQq3Rz07GgegDnH+tIfcl06Lsx/KKPun4ieGFEAy2ndcAgBp8ys7cMpqTO+LY
	rBmDuMtPwkqAETYLTA+S37mhjNgpHPydgfLHDLXO8rxXOUDZDbX4+fjomeCcaYUwVSBEVgH1xWI
	bmqHYzYW2JnxQl7uPPoITjCABzOfS+SlY7GJnpiBaTW4vIpYaDWXHkw/byFbuRXSJBh8cHIuhFN
	QqT8gIIIdyoNuqt/z/bXhi6FNZJ8jl6HhFvXQgPHNT0vok+RPA==
X-Google-Smtp-Source: AGHT+IH81RSmoGv2vG9iqqRjG+DYtBzAdJMaGkRjl+5vBHC3a1xD7FDcQMu2Rp5DtnM0NFxvXyDmyA==
X-Received: by 2002:a05:6a20:2d13:b0:1f3:33c2:29c5 with SMTP id adf61e73a8af0-20179787583mr1577432637.7.1744331940263;
        Thu, 10 Apr 2025 17:39:00 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2335294sm212602b3a.176.2025.04.10.17.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:38:59 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com,
 linux@armlinux.org.uk, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2plus_defconfig: enable I2C devices of GTA04
In-Reply-To: <20250228112750.367251-1-andreas@kemnade.info>
References: <20250228112750.367251-1-andreas@kemnade.info>
Date: Thu, 10 Apr 2025 17:38:59 -0700
Message-ID: <7hwmbrwmzg.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Enable I2C devices of GTA04 to get better test coverage when using
> the defconfig. Until the I2C host driver is fixed, BMG160 module should be
> blacklisted when booting on the GTA04A5.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Queued for v6.16,

Thanks,

Kevin

