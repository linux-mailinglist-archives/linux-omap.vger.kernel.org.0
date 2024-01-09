Return-Path: <linux-omap+bounces-234-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69866828055
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jan 2024 09:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F0B61C212CF
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jan 2024 08:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C9F14AA9;
	Tue,  9 Jan 2024 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BYdhY58D"
X-Original-To: linux-omap@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6925757
	for <linux-omap@vger.kernel.org>; Tue,  9 Jan 2024 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704788283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P/n6bIUbxiGj6HkflcqkLH0/hS7ErA/FC9bHCDvM3UU=;
	b=BYdhY58DuHjmJ7Qk47tXkTk7z8igHZnFm7JT05zHRvq/1rZUStwwmrCq5c8o0MoZI9Iwd+
	GeZaV2LaeEB474EhUjWo/K5M7MvDrNW22H9103LcwBlkOUIDXcsRYvtbnmUOXwA/w2dtyt
	ZjIF9aKMjdmYrYsJO9onUPCWE4XhlRk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-R-i3un5OMmCRi1FvOenPMQ-1; Tue, 09 Jan 2024 03:18:01 -0500
X-MC-Unique: R-i3un5OMmCRi1FvOenPMQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e4c1dd8a3so5827445e9.0
        for <linux-omap@vger.kernel.org>; Tue, 09 Jan 2024 00:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704788280; x=1705393080;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/n6bIUbxiGj6HkflcqkLH0/hS7ErA/FC9bHCDvM3UU=;
        b=KvUg06u/KEdHr0x73T2bs2QlznThTuXJMdpVZ31SP5vNP9dD0MRBvD30YZO80XXrYr
         o5XMqu94iLh3YJ9PVwc0EReDbBVKnRV2HHMBY0Ye4RbefWzElRQAuUAGccOh3e5l8TDv
         6KdCX75JBs/Md2fD3/IB+U4+SAKknXN1GbM5rodDQeuQctgJyrOTeQOwuPA303E6Oa+y
         l3dnk8WmrggL+jWZNyrduxbDEtvra9lUQWDwNEJgOLeph0B8Dqa2V0t6QAm8iVhmnh6H
         VwzCtmmLRY57OJGMV37QdyEr07BVwb7nLv/hR6zswCL9c4/W8JGD6ILTCmFmWG+6/qSF
         mDeA==
X-Gm-Message-State: AOJu0Yw+HRU5ysGPc4lU1WtgbxjyKXeybayvjw2TeSZ7EPCxaCoio9nJ
	00v1TtwAkuNeZox6VkrZi4ja+tc/X+oDH7JVPhRPLaBOkG0UZ3I3wZUmRxZfdNIyuvAzbICw02R
	leZ0yFJRlkMxrwHwvf9Mzx2QWCJY8bw==
X-Received: by 2002:a05:600c:3b8d:b0:40e:5136:9c1b with SMTP id n13-20020a05600c3b8d00b0040e51369c1bmr141960wms.171.1704788280601;
        Tue, 09 Jan 2024 00:18:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC/CVCQxxwutC14ngh1OLfN28XsPAOZa3F7Km+RhSKTaEmlH4ND2gHIL5o1B6PeT/ovdJFSg==
X-Received: by 2002:a05:600c:3b8d:b0:40e:5136:9c1b with SMTP id n13-20020a05600c3b8d00b0040e51369c1bmr141937wms.171.1704788280323;
        Tue, 09 Jan 2024 00:18:00 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b0040e486bc0dfsm5117272wmn.27.2024.01.09.00.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:18:00 -0800 (PST)
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
Subject: Re: [PATCH RFC v2 06/11] ARM: dts: AM33xx: Add device tree entry
 for SGX GPU
In-Reply-To: <20240108183302.255055-7-afd@ti.com>
References: <20240108183302.255055-1-afd@ti.com>
 <20240108183302.255055-7-afd@ti.com>
Date: Tue, 09 Jan 2024 09:17:59 +0100
Message-ID: <87le8yrkco.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andrew Davis <afd@ti.com> writes:

> Add SGX GPU device entry to base AM33xx dtsi file.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


