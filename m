Return-Path: <linux-omap+bounces-4888-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D170DC48E6C
	for <lists+linux-omap@lfdr.de>; Mon, 10 Nov 2025 20:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 56DEA344145
	for <lists+linux-omap@lfdr.de>; Mon, 10 Nov 2025 19:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A121F32AAB2;
	Mon, 10 Nov 2025 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FmwAFKim"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C55320A10
	for <linux-omap@vger.kernel.org>; Mon, 10 Nov 2025 19:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762801777; cv=none; b=baDR4pVs1iCa673+CvstjUTxm0Um1EkMCD/uA4QxYOJQzJZsf7Zt066x48Oma+v2X6JdtKwt/BJWYBNytJWcdF9+jJme/qIdBOKH8X1XR6i2CSZSSRKXnCdYjcS9qSKNbrIhaEz2diJ/JNJQWjWnS5IUL8f1jDbH/9x4UPg3vxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762801777; c=relaxed/simple;
	bh=pjE8KQuvzc9zkIIqC+ztU2aLEN0NS7tHjOH0lZb2hrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IY9kXdEPVMRqwzJW3b0agSJME/apPH2HNc+3JABqkT+KHFCsJQbbwEK5O3zyi+PfgtqTcv6AIBFCB4jm85ZqPqMdb1wbd4MBI29yIRI9YKcaQdW4PS9oYZe8ASYIrmFVfAlb54KE4SZh9wWMcJA7onRi5wBdD0T+8X5L/UgfIQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FmwAFKim; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b25dd7ab33so113973385a.1
        for <linux-omap@vger.kernel.org>; Mon, 10 Nov 2025 11:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762801774; x=1763406574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kh/pfFXNphB5J8FM7JSKHKBWUvUQumq6jmykYXtU/Fk=;
        b=FmwAFKimMwtSibfm03rcXaOMGDfo0YF3a65NIcuDu149ThAK3OQobOs6QQc4eSbvWg
         AOz4Wx/Vi7n+SRe8WmTU3gy6zCvK58F7+8y4f2LXSYrAMJVjt6ju+05MzfCjPcCyyWJa
         6wwJ6flpxzs+wksqC6o0eY+IfGGEGXV5xI6xc/Hjese0RXEmWS612Uy7o5bQ7PgBpQ7+
         H7dIWSbPuwtHTFWnQibzIkNjbxMC5WVatKBVnPXEEQrigHOnR5Cz+jQ6/lAJ0wNil0Jb
         i3QNnZy+lAufOYnOy9NzZLIX6hetk7JjPBx/WZZ48svd7QhWTz199h3fnQHiJO/U8uow
         +iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762801774; x=1763406574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kh/pfFXNphB5J8FM7JSKHKBWUvUQumq6jmykYXtU/Fk=;
        b=oTGubTcCHVrRsbKVuXRBcMevUG5k5q/HTbnvXogHQbyAEhibjRvFs+fUcV8UqD2yd8
         CUK0x66REd6LPxZNKWbnRitEUwZqmK5vnvAZ4V7rk4UulAVkBz/XVakLH3TNJP7p8huS
         bHE5K8VPvjLo7or+3pUquMnqlsPP4DV36T6eNyuZvmrYxWwlZjpUNC8wocpR8l0pXo+d
         TAxK/d4XeQ66n5USBS0FXVWBT1jCoORIOt4Db/NCRt+eHd+xmU3Ir4ZrMMfmGoAvbDn1
         5jG+kiNGgS1cMKKFpib4nOae26UUkRjqqe4wLLsD1HUjMwplDL8f3m3G+zKVpxxaO1ug
         +F+A==
X-Forwarded-Encrypted: i=1; AJvYcCVACMhiUsOsUXbiEnefpBGdn5/jdVn3S8KqGKWJmeD3uDcpYv3j6wgg/KMRSAj4LXknbma6xDlq4JLY@vger.kernel.org
X-Gm-Message-State: AOJu0YxmhfympMsNEnxaFbNDEqHbWJ3PA5CT/5W8GADZMyUMS7esJMyO
	NCNGRMFdHxj2vLRyK2FgvORM2P4NsBS4VwEJlPvJbCEebCxniZMFD45/
X-Gm-Gg: ASbGncv6WKfSVgisuVt2Jb5rbkyihZ3PYuNwifxc1SeRVHhRhEmXyvNsecwzVEWdlZc
	wYJIbc/SzE1hfGS+9J0Osy8I+/EPbW+3BNiBGJSxOsjzBSRjJaYSllxxGLiptHqee99faeVKQ7Q
	RclLCItfd6fBZf1t2lBXraJ9U2hpJRii4/2y2/KmU3kvnI36llU3SD8P8FR3xc6ipFz0zbHQB8G
	BHIu2lSFYwJZXXm0LlqPBmkG3nrF6dtKj9SGorh2/UVPWORY4YwW9CcwUtJgqjMz3hQnzallvrn
	pU9H+5ihjhC2FouK/Y/mHYdHDM/hb0dVDpwpLKYD/lHVgsJa1DlAtlWZ+CNvF+ruUiNmQCKpxzY
	pG+gF1xoHUHczzzL/1TnHFtHm+Fq6LT2JrYjciHMTuZrHwxQjWKKxXevEpdLPBiPE7oVqy/NSZJ
	NQUIOdSzYnZSKMZVhucj7v/RjXtrDPOvI=
X-Google-Smtp-Source: AGHT+IERCXMjJNRnt0BFVnvUSTvP7ZvwPBkw2ba4rSGkzoC1mJwG61sqECbRHnlBF54bJjOGFPQBbg==
X-Received: by 2002:a05:620a:c41:b0:8b2:1568:82e8 with SMTP id af79cd13be357-8b257f05374mr1272565485a.35.1762801774300;
        Mon, 10 Nov 2025 11:09:34 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1145:4:3280:a85f:e61:4547? ([2620:10d:c091:500::5:432b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b23582b0c9sm1066092985a.55.2025.11.10.11.09.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 11:09:33 -0800 (PST)
Message-ID: <61e1b43c-e8cf-491d-83b0-22ec46784a88@gmail.com>
Date: Mon, 10 Nov 2025 14:09:31 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
To: Jiri Pirko <jiri@resnulli.us>, Saeed Mahameed <saeed@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Srujana Challa <schalla@marvell.com>,
 Bharat Bhushan <bbhushan2@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>,
 Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>,
 hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 Manish Chopra <manishc@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Vladimir Oltean <olteanv@gmail.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Dave Ertman <david.m.ertman@intel.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-rdma@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com> <aQ7f1T1ZFUKRLQRh@x130>
 <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <jhmdihtp63rblcjiy2pibhnz2sikvbm6bhnkclq3l2ndxgbqbb@e3t23x2x2r46>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/25 5:46 AM, Jiri Pirko wrote:
> Regardless this patch, since this is param to be reflected on fw reboot
> (permanent cmode), I think it would be nice to expose indication if
> param value passed to user currently affects the fw, or if it is going
> to be applied after fw reboot. Perhaps a simple bool attr would do?

I can add something like this. For permanent cmode params, it might make 
the most sense to expose current and next values the way mstconfig does, 
but that would be a more complicated change.

