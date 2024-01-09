Return-Path: <linux-omap+bounces-231-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45116828044
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jan 2024 09:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75A111C21514
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jan 2024 08:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3151413AFB;
	Tue,  9 Jan 2024 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8HwYFsv"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852752554A
	for <linux-omap@vger.kernel.org>; Tue,  9 Jan 2024 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704788226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/6SvGjQzgj0djYosTjxGA3G76aXlsR8fit+b2iceA4U=;
	b=a8HwYFsvJnmRziWRNBKFeulXtL8CV8CthtUUqC5VEMWdfO3HVjaKtT7TUG/OonuwTF0BDC
	BqEeDOhfWihYPsCNIF2PankvzvYGkTano+VvT9n+7X+ABh5ohkRrxk7Mt/AB8S9Ekh9PjR
	SRiJCufDidu+ian+NXNtYaswBab7sH0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-XKPhh51sNCixzPG241hrnA-1; Tue, 09 Jan 2024 03:17:04 -0500
X-MC-Unique: XKPhh51sNCixzPG241hrnA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2cce9488687so22062211fa.2
        for <linux-omap@vger.kernel.org>; Tue, 09 Jan 2024 00:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704788223; x=1705393023;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6SvGjQzgj0djYosTjxGA3G76aXlsR8fit+b2iceA4U=;
        b=HsYPxTrdmGu3YDhTxzDaZ07ah6HW8SQYeIW1whz4pnvAyNnL/Fu8VuI1mWUFUsjwFf
         oajsTeMmw3UCpkbxKxrmfsF2A/KSO4AKQ7kFR4dskCFxvmC7lu/VAeNZnePqtwORvEbh
         1TQHbvThNmK8TgccGCjO31eux2QWcIfakgr6cGEnNaAcl4mLbp/WK3wvB6OHljQoSJjf
         6/5+ZvPHjToS7RxHDiW2ePb9tROzOhx4CJBcfRbDSiJPaursHZ3+/ewVBh1X1D2xfpML
         ZCxnYs+OvVxanP/QTaH+qf8C9Bf5j4pc4J7KuB7fbdMNJwEtaCzFeaK6diWzO8Fl9fBc
         X8Dg==
X-Gm-Message-State: AOJu0Yx7xoZqwE9FwaoHhmeGpRuXRt382HNUyMj8oC+jx8BIh9MJMsRF
	TBn5VCe1HjnwEaNM/4CtEFaccmo6geufl6L3X2rQ3mBoU5T4S02+aeTSZdURFii8UlE74aIL9X4
	nGjK1I0TbDKrwPeK4nWVPG6H2epzm0g==
X-Received: by 2002:a05:651c:200c:b0:2cc:eefc:20af with SMTP id s12-20020a05651c200c00b002cceefc20afmr1754467ljo.52.1704788223504;
        Tue, 09 Jan 2024 00:17:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXdSt0D2TIsDyVPefhROVCDL4qYlTpdv/7GUBf8E3u81rzcgdNCvKFp8M1MVzEIK9FSzaftw==
X-Received: by 2002:a05:651c:200c:b0:2cc:eefc:20af with SMTP id s12-20020a05651c200c00b002cceefc20afmr1754447ljo.52.1704788223210;
        Tue, 09 Jan 2024 00:17:03 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id l8-20020adfe9c8000000b003365951cef9sm1701196wrn.55.2024.01.09.00.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:17:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andrew Davis <afd@ti.com>, Frank Binns <frank.binns@imgtec.com>, Donald
 Robson <donald.robson@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 "H .
 Nikolaus Schaller" <hns@goldelico.com>, Adam Ford <aford173@gmail.com>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 =?utf-8?Q?Beno=C3=AEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero
 Kristo <kristo@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Andrew Davis
 <afd@ti.com>, linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 03/11] ARM: dts: omap3: Add device tree entry for
 SGX GPU
In-Reply-To: <20240108183302.255055-4-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-4-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:02 +0100
Message-ID: <87ttnmrke9.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Davis <afd@ti.com> writes:

> Add SGX GPU device entries to base OMAP3 dtsi files.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


