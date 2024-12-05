Return-Path: <linux-omap+bounces-2781-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1D9E60AF
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 23:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFDA1617A1
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 22:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 119CF1CDFD5;
	Thu,  5 Dec 2024 22:35:32 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F041A82C60
	for <linux-omap@vger.kernel.org>; Thu,  5 Dec 2024 22:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733438131; cv=none; b=WjPLuS5BhrL7LpA56mgShxZLjQ3+/TlpMd5QIq124/zoUc1UczTo5hrxKTPyOCDBno9pJQaUYmusK43KRqij6uMft4ucGZnu1ALg66Rv/bYM+AZ4BiUOnfQGzKU/D/a121cE2BkieXTbeLyIgMyG8Pmwzws9aKtObujvpKRW6+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733438131; c=relaxed/simple;
	bh=2NOL9msOvgRoeaBxY0bns+dpAJnTLo16D65qGElnkpQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pn/4hi5JdHI6duRk0zS+Gt+9uEjxx34Mrbs2leAV/YlmWnW15t++0mJZ8qnWsLxPouy4qKzBHLqSkhHwgRs0QSIB/DBzKAILGgIqYXfe0P9y9jblM2jG9POzRMdCbzz2Bm4jEFrX3IOgTYCw0MjcZnAC3+SwIjseUhtyM/RI01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724fc1aaa91so1566536b3a.3
        for <linux-omap@vger.kernel.org>; Thu, 05 Dec 2024 14:35:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733438129; x=1734042929;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtEYOiTLjn6+EkNb1gp+QTu4LUIf3CrgnNhL4DA6X8E=;
        b=RW7HwDZqatbaUqSShkeGG7pK4c+/Y5PmIcY2eqrXGvowOx0TjkqiNGdNFLlSdZIz6d
         NXxpwmbDgTBd6MpU8VOULnR4G6W32u4PQumL75WvxLJjPC69QR9s3ElUQR1kb4bjHNwA
         8dgw7wc/BD37+b4BzYPRY/J8Mwh1VqsJ3L5P4LkSNFoygmRAvZp83HeL7pXijwAqifRp
         iaQFKQblc9sD1Dxcv0Q3pzmpla2y6RQ2zViEDFE5Dir9W6BLIsMa/XoguVvPeVq3TKfr
         5d70/qdvDvimd6TJQ92n7uh5RbK3Enl3DQ9PZqFGzQiVQqDeQGE2uO3DXVdcKm5zmBWw
         BLzA==
X-Forwarded-Encrypted: i=1; AJvYcCVJb6scg8XhBZ2uLyCuO3k7kFuOz1S42HqxS9GLsEkIJ+QCQr798mQqNgb7YI9uPXDnlo3oDVs9Vv6x@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7+z6XWNiWvZc/DcC8GKH3Y20SaC2IP7aAoiXtwiqujsYXKSSE
	/V2eO1p7+B3zX0FmX3Tv1h05spr0SDrFSt3SIlbMmjXo+I00KG4mfClcX5bs/jU=
X-Gm-Gg: ASbGncsEwyWiWFX3DhJwipfT0hig+NgWZrah2qJY3RjJJkgi5HRFZvrhqqXYUDl6G8+
	v0vZRM02tX4bzgpv07kHteoU01NG7VGl4g26wS4QnknAN2Rkw0xxWiDPRQFSxNBmNpsIUadrEUy
	6mq2grcW9y8KHYVaZHhJZEaSjsI60AJW6EnVoHy2sMaUbZSuGVS+hQUDbFCJnWorBBCjeb+3JKI
	lUJyRhoCVO57krWH9k/J9+LdRg2uJtHvTLztzNnk4NErgPa
X-Google-Smtp-Source: AGHT+IGb+Gho/439wgyLRKr7+nVR6NWlx9kr/iI53YBtIOzs5C+yxoRN0cNAmYC6YxSr9ZD94jwklw==
X-Received: by 2002:a17:90b:5448:b0:2ef:2d9f:8e58 with SMTP id 98e67ed59e1d1-2ef6ab29c49mr1173721a91.34.1733438129083;
        Thu, 05 Dec 2024 14:35:29 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef26ff844csm3801590a91.8.2024.12.05.14.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:35:28 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, Andreas Kemnade
 <andreas@kemnade.info>
Cc: rafael@kernel.org, zhipeng.wang_1@nxp.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] cpufreq: fix using cpufreq-dt as module
In-Reply-To: <20241125051302.6tmaog2ksfpk5m6u@vireshk-i7>
References: <20241103210251.762050-1-andreas@kemnade.info>
 <7httcmonip.fsf@baylibre.com> <20241104201424.2a42efdd@akair>
 <20241125051302.6tmaog2ksfpk5m6u@vireshk-i7>
Date: Thu, 05 Dec 2024 14:35:28 -0800
Message-ID: <7hplm5hi6n.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Viresh Kumar <viresh.kumar@linaro.org> writes:

> On 04-11-24, 20:14, Andreas Kemnade wrote:
>> no clear idea how. What aliases should I add? The cpufreq-dt-platdev is
>> not a real driver, so I could not create mod_devicetable aliases to
>> match a given device. It constructs a device under certain conditions
>> depending on the board compatible, so no simple list of compatibles, it
>> contains allow and blocklists.
>> 
>> cpufreq-dt then binds to that device and that one can be built as a
>> module (which then made cpufreq-dt-platdev also a module, causing the
>> trouble). I do not see any benefit from having cpufreq-dt-platdev as a
>> module. ti-cpufreq has a similar role and is also just builtin.
>> It does itself no real work but provides a device cpufreq-dt then binds
>> to.
>> 
>> Handling module removal would probably need to be added and tested. I
>> feel not comfortable having such as a regression fix and for stable.
>
> Applied this patch for now (with some changes to commit log), as there is no
> clean way to fix this for now. Got reports from other folks too about it.

Oops, I thought I had replied to this earlier after detailed explanation
from Andreas, but I guess I didn't.

Thanks for applying.

Kevin


