Return-Path: <linux-omap+bounces-3005-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF747A0332D
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 00:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487563A0713
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 23:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595271E1C11;
	Mon,  6 Jan 2025 23:07:53 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6011DF756
	for <linux-omap@vger.kernel.org>; Mon,  6 Jan 2025 23:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736204873; cv=none; b=iQHckEEPlBTynqs1X8J7GAknft0CWZIWHTcz33PP6VDYnF9xRs4glty9XAzNylUXGRHC8v8dgd0PmaprLESDmZu5OpgXDzkJ//6LXhl9J3j29sXj1HBWC3TjDmkEmh/KQRD9vc9hODuf9uetkhQE9DmlxtA0GUq0MKBDwc9qd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736204873; c=relaxed/simple;
	bh=QPKVwuyC154yrpGKNKQiqD7N3ttReF7lRwttSQAv1NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TduBAd1uTCNTZuXI+LeEiJg1/96BgphadV0xAEmZLr+7TBDOtMDuKFIlTRFalm2I/Zna3dYyVaEicr3ZZlcpTN23N8mL0ZHrT8zjYtyQFP2s+3lyZyIWr88agX6MHby8PR4pr6VUsPfONTwhyGHhSWXS9vqkJdjzGOiUrwOE/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-215770613dbso160633555ad.2
        for <linux-omap@vger.kernel.org>; Mon, 06 Jan 2025 15:07:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736204871; x=1736809671;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QPKVwuyC154yrpGKNKQiqD7N3ttReF7lRwttSQAv1NU=;
        b=gnpkKPOdPNwnEcnpIXb7sSl2CNQobshObFYtdIytp5JApc7j0T90+3jgK9Gf+qAEUG
         72760lOJv8Zm60eosg9anAsApYaeBTzEkkwwCVlpxqZdo35min27IfokG3PFnIZdJXkp
         OCt4RfMaL20vYA7ao/oyIBlz9y03jNWUGH9Tqh4U3knQ5xvyslYKIEx3Rp+Fx5s1wOtg
         vyEyeNImdLqL9Sx2g0pbLpOw2TK66C2R6X/9Ng1z6IJjcgkPp/j5zFKPgwm/kwwPYw/5
         ddsCGsscmUMdcEz60mhUjLNUCNGrsOfsz5LyQazqv2qjSa/xrxaDBEwamatg08bRWjpz
         h23g==
X-Forwarded-Encrypted: i=1; AJvYcCXeBywer/AFeWcQ/peBe8SC66lnpZKGAXjbXt8zYvyL9e4n82s/PeIGEhcCTW56kt2ap3cj6819d8g4@vger.kernel.org
X-Gm-Message-State: AOJu0YxG0CC7URSeHeFdUEMkiaJ4GAb35JDhmcjhMZeXgmmcIwwIOFPo
	gGx7T+49ZOyW1mI7vy27HNCfL8YdtVYKqf8OEgtuitHojYXVzQ9eP0gdnjlKdNg=
X-Gm-Gg: ASbGncvPypxf9gqsSp2zZbjJKh/OHexePriscE/vcbEjw5lBxbvih6zZHnBNpzFMPmy
	xAWpI9sATnQlDCh+RVh6UwzAPh//CYlhZZ9DOgx5r5fVXJDLf+njF4E6IbEQUq1iV7wx5gp0D3o
	P8rI29Vd2bVA50km0uGOudBwwLE7053jYugaYIxj6ujs/qcrLsclcAGmH3WySaMdEl1prhM/jV/
	tGcx3RtRgNDaSpc5SzrGZTel3fVxO3Iuk4fzgBMX43/XBGS6wLpp+M=
X-Google-Smtp-Source: AGHT+IH6hRaGsYu1THr8tojXrvILWNkdfCnHtGTAK43r47Oj1S9W+uktWYkoDYwwa5z/K2tskk/kYA==
X-Received: by 2002:a05:6a00:8085:b0:724:d758:f35 with SMTP id d2e1a72fcca58-72abdd3bf92mr89596823b3a.2.1736204870809;
        Mon, 06 Jan 2025 15:07:50 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbb4esm32945990b3a.124.2025.01.06.15.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 15:07:49 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Judith Mendez <jm@ti.com>, Tony Lindgren <tony@atomide.com>, Kevin
 Hilman <khilman@ti.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sukrut Bellary
 <sbellary@baylibre.com>, Bin Liu <b-liu@ti.com>
Subject: Re: [PATCH] ARM: dts: ti: am437x-l4: remove autoidle for UART
In-Reply-To: <20241220223523.2125278-1-jm@ti.com>
References: <20241220223523.2125278-1-jm@ti.com>
Date: Mon, 06 Jan 2025 15:07:49 -0800
Message-ID: <7httabbkxm.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Judith Mendez <jm@ti.com> writes:

> According to the TRM [0] in 21.5.1.42 UART_SYSC Register,
> the autoidle bit should not be set for UART, so remove the
> appropriate SYSC_OMAP2_AUTOIDLE flag.
>
> [0] https://www.ti.com/lit/ug/spruhl7i/spruhl7i.pdf
> Signed-off-by: Judith Mendez <jm@ti.com>

Just curious, does this fix any particular usecase for you?

Kevin

