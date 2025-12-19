Return-Path: <linux-omap+bounces-5224-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD79CCE864
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 06:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C34A9303C984
	for <lists+linux-omap@lfdr.de>; Fri, 19 Dec 2025 05:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E47149C6F;
	Fri, 19 Dec 2025 05:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ9TNMYZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB32BDC04
	for <linux-omap@vger.kernel.org>; Fri, 19 Dec 2025 05:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121844; cv=none; b=h43xWyn/HFYI3V+ytgr/h18xJ6dGBNk8iDyU4NjGOGCfJnD3ygHS5Y2G7X6sDrsNG/+dbc6mTjiGR+vnIN9Zfj0auB02aXGZZ8GlRu1HjUcmIh3B0nju9Q6VXTV6a6jxj5suCfDQbpJcn/o5tHkg5jxCnkUUSTG2rqtZe1U09Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121844; c=relaxed/simple;
	bh=hpVgyNRNTF/7kcsg9lnbnogjpGsM8Obr3fagkkDIX8g=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PilkeKQ3tD4nbbOseZ7kqjT0Mo9dLvv8Ja4+FtijzM8ZHFuLcEic/sCu1EpSHf2OGW0to/6vQQLrta/UO5KZODagFE3gKHjnTG/OBgeXYaSHYBo1WdRHPr81C7a9DjoP/i7qgwJIhEDFkMakmlfOr65khNlmG8yVFDn3Y3i6eS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQ9TNMYZ; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso1040197a12.0
        for <linux-omap@vger.kernel.org>; Thu, 18 Dec 2025 21:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766121842; x=1766726642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RodLP0AzMxrSO+sVsgHgtZsW0nvryzTBS7wWjzUGiPk=;
        b=bQ9TNMYZ+ZZxkYX7PMW3D6IMIfi40uX6/FxmZm9BNKybNi8jOsbc0NL4BfLk5vhaku
         WuGVzGRHOx+B5wRq0NUh01svkYCAn8S+3xV+51LXq83w8wrURm0H3k2c0k4tXuXV1D6p
         0Dodv/9QdrfyH0kGnNtI7Wb6GrYq4qqSUYWOmia1hvLVal7HvgfdHZv7bBoLulBhCgg6
         +G7P1hRzNiuTuvNg/x+MYeG4f+sOM9ZAcJe8Xpc05sde3BS9USMNYVP1K3Rb19yLDgM1
         7Y1I+jz81kG/0cIAmZYEUI4tLxLxj4jg1cUf2LEeilJuqPpd3D4e9rTA2jLbC6QatPhk
         wg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766121842; x=1766726642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RodLP0AzMxrSO+sVsgHgtZsW0nvryzTBS7wWjzUGiPk=;
        b=v6tmMIOFFZmXkeEWiuM55huArYTFDVd0sStpdEsUnSRvzSJqyxS4uBhXDZ3gEnq1EI
         8xlMGzWQV2ynassxThTgkB1mY7b6ZEUZQDDqmevcCw7ak4mAyuY/T+rUkqh1J+lt+PfF
         gkhdh8cqRdk8S50iNAijXWkPuwCiYhw5HwwdS5HEY3Bsm9GMO34GNPOC1wbepSOyMmpf
         Ip+QgFUC7RALW6IdUl2fDFsM/+o6ISm7vIzDA8bTDsEZIUhT83ZXhv5//ta82RvevgC2
         u/D0hU/N95dE6H3ViNVwfZcVFfvkculAjOjwGF2fNez9fDjTZi+KPKuLqJSs3V6pB9YS
         GJug==
X-Forwarded-Encrypted: i=1; AJvYcCUzq+IhC1HjWHGf29vtzh3QWWk983bMiwCXNeSYuluPZVIEplni3s9AZ86+/BK/icNk7uC3lt7cKWm1@vger.kernel.org
X-Gm-Message-State: AOJu0YwX7z+z4p42stBAqSGTiNNOeyWHc/vjdMQQ1cQBlaOynjUEUryj
	2hbFsSQqx13+aT+i4WVmtX0GQNIueooRBmre8837msYKIaj/r+FY5R5O
X-Gm-Gg: AY/fxX6F1mFEKtBR458guOEc7vxmiY7tEVkwN4N/Oj6UVWiJixmYWK9g1JN8NWnZIMm
	25n5lC7OwiCtCKsje4Sywg20cR3FGKvGTrqTA7shTHSvNDjg4RT5sauwtKNJbyz8UIHq0Vn4w3K
	TNoD01mjOEXEG6FHncm/Johps33b+DrWTLKz27yJcYt5Q1oKHr/H2F3jXLJX1TlGMpKB9eXtYNI
	T4aG1EWFfXy/yToGzC3zSGtafqBUHuuCPYTVtrmNbIGIzHmekg9tl/1inMmN00tcHF3Kgq5RDaa
	FFMTk73DMp+/DPrFpkhb/JoDjXK367iXU9iFESNHO1x5XuAPrLyzEr2LXnnO9QkFwA+EzE4EPaC
	e9KCz9tBHutYWLhyh4vmeKLqCsQ4DEVRtNEYCpdediPHMNPisXKpLvWxtUdpX+6ivOrPqzBDxwG
	4tgPsqqcWp08gxrvXPIFr/hK0+CcV1l2ZbR8Kz38jID0va+6rdP3aE
X-Google-Smtp-Source: AGHT+IFDgJZwNEBeeKwBL3wo6S2qUd5lDxhYjadobhv5i0Xz6F5uVOsZEz3MvEz02kCvTGgmYV553w==
X-Received: by 2002:a05:7022:e80c:b0:11d:f44d:34db with SMTP id a92af1059eb24-121722ec1a5mr1842609c88.35.1766121841950;
        Thu, 18 Dec 2025 21:24:01 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm5033647c88.4.2025.12.18.21.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:24:00 -0800 (PST)
Date: Thu, 18 Dec 2025 21:23:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] Input: twl4030 - add TWL603x power button
Message-ID: <waxqf7fshz6nyupfky3dgap4x7m6b2mwatouxvwvguwqdvdvop@ubehn3xzl5iy>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
 <20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-twl6030-button-v4-2-fdf1aa6e1e9a@kernel.org>

On Thu, Nov 06, 2025 at 10:00:26AM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so extend
> the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
> does not provide mask, unmask finctions, do it manually.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry

