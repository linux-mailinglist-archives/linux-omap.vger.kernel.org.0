Return-Path: <linux-omap+bounces-4897-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1AC4EC4D
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 16:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 816561898876
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05861363C4F;
	Tue, 11 Nov 2025 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfPf0wyZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A6635F8A5
	for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874397; cv=none; b=q5mgaWAMjzsgxP16vnRow8xvAQf17rQytdG/zNOWyb44RZ2WaiYkZejQomGmBHFym8cd/BG6Cx5bopW7ZZCNq5Y/m7VYf3paAiAG+TPo7aOm13neafEI8KWsxRYj0sFPRKNAOW5K8i1z0Oub+G4VnIIbNTgD2pH2ZOagGGf4CHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874397; c=relaxed/simple;
	bh=94GtY5KZjXmZPjl12JvyfDt0aWegthwLuMtBUxxbiGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cPv7Wc7hB5vZoncp8QVc1EZ97Jrftpy97tGN3domuW/uqQMtLFtarZXVau4vp7OTiRZs+bPQMyqxkC2NILmwptKt2DJZRoi1HDKhFc0OdpZBZMhks6CxGCC+twMqXWdi9h5I/rCAagYlfn0xtG3AJN+Yy0YVbjMgNp6J0Hu4TGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfPf0wyZ; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88242fc32c9so32076746d6.1
        for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874395; x=1763479195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A5SVOaFDlCV2uNNJy3v3HZSAyck/afp0AOlD6vgrWKk=;
        b=gfPf0wyZuFA8eXSbBfB6sx8zsYhWsjzbtWIuwEJV9QsCbdj4lXEiwvy14oPL+BLR2i
         QoEiHfQzIwTYN7EOvavJICHoG90ewvQHqv2A5+mZTlcQVHT0Bwq8BeuHKaiiY2YIkfH6
         NoONLltZShp6fB6OmgBJrTPgxGV30KCdEVYtKj4fg7C1Zv3oIsahUCJUvUqDH36SPkiY
         +DyJtYml+nBfyd+3kh4/vrh3arhdTbJLi+O5KNgKBtcOphhOTksm0+o/xDNaRzuzMLrc
         229Jgt2BIDuxOfk5BW7pXpQtjKh/X3gF2Wz784UJx/Dsofz3nIyK2Xo20SAtmnA+VQ6B
         0vgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874395; x=1763479195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5SVOaFDlCV2uNNJy3v3HZSAyck/afp0AOlD6vgrWKk=;
        b=nE4c0tU8SsDpfrCTWCECXjCqeqB6hbBH//YKD+k85TlDNTKs4wVN/8Ip3YP9zTNGiP
         /BloSv1wFmjym6J2BT3qyhHkjE1ciyuBhMrwKOSsy3PuhKhSo1ym++kTp8cZZtND0HOJ
         AvstOjNQ2VWrqSfiNEImIDhGtQ0Bi3rfqAh0WyjxFZcYFMUOjllNaZetg06KM/Jagl7Z
         X04jR4tfPTSnWzcMm77dXntvwsWD+4dfZH8jv9Rr+00VAtRO+FQum2DAg/PDfaHMOYWC
         cGeVyb6zPTSquQT6EX+SVMY/AE9y6OIMiczQqW6Al1Lt+PGdsLGNxRAe/4RldgeIJE9y
         X8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUv3iO4PgXUnNAPdYuDbd/+8S/SHcsZUa/QPXzilXD1Tu8IQmtUF5mvQkVgTqxomb2ZL8QgJbGZFOQP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw42RjKRwevZQ2ngTzesU8cG4KEb/bqozn1zur05CPIN5OwzLOj
	oNkme+iO2M59eOUkRBOvQzSiaIc1BZDVOpylbuoBLbUwDJs4Np1vcAP7
X-Gm-Gg: ASbGncuy/hfQTCHVLxiQwAOrrYeE9wJJquPI07y0JP0VdiiRWfTtCAsrsb+Z52/vJpD
	YWnpEqWf+23p0eabWFKc0OKZgCESCJacM9a7N4hxvx0gzsaEHMXEQ5ymJDbp2wwJj/SFs+gVJKz
	KCFYlvCWVSRzZ/v1ITK0SmqteKYDgLMJzIMhiXh/02z/oZp5foAQUzIo13yrVT33mk8y1pH3tJ7
	RHnBhyrw4/nWGKt2yxbdW2r3qz26z1SE4livk634dAqkrzr1zc1NBPVDWo+d9nsYBvh/RSHOlXa
	UVtMfjSV8v3Shd4fWPs6cOl2YkdUyvsQlt3e0HmUiquYh7/srqEQQ7K08FPSRBHF0TV9P27Ju3f
	HSIqlYl+GLo6iD0O8QfF0zI/2kh/AKmR8As45gcZjWRrGSQbUA7mVdTm1DaR4U1fWhqBJ00ZQA3
	LBDNgao6ZZ2WxJlHfOULiZOlkE
X-Google-Smtp-Source: AGHT+IFAbbyQhephY+AI/cqoiVmNsBG/fPVAb6kdOEXVVnWOQfxDiV/20VWcE/IFvlGD21yeGrFzgA==
X-Received: by 2002:a05:6214:21c4:b0:880:5636:6241 with SMTP id 6a1803df08f44-88238769402mr175766236d6.65.1762874394765;
        Tue, 11 Nov 2025 07:19:54 -0800 (PST)
Received: from ?IPV6:2620:10d:c0a8:11d1::1065? ([2620:10d:c091:400::5:ddc])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88238b4c3c0sm72793516d6.33.2025.11.11.07.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 07:19:54 -0800 (PST)
Message-ID: <9fed6ab9-e748-4a78-b45b-5e6b3cc58006@gmail.com>
Date: Tue, 11 Nov 2025 10:19:51 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
To: Saeed Mahameed <saeed@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Srujana Challa <schalla@marvell.com>, Bharat Bhushan
 <bbhushan2@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>,
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
 <20251110154643.66d15800@kernel.org> <aRKs6jXqSvC3G_R0@x130>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <aRKs6jXqSvC3G_R0@x130>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/10/25 10:26 PM, Saeed Mahameed wrote:
> On 10 Nov 15:46, Jakub Kicinski wrote:
>> On Sun, 9 Nov 2025 11:46:37 +0100 Jiri Pirko wrote:
>>> >So, I checked a couple of flows internally, and it seems this allows
>>> >some flexibility in the FW to decide later on which mode to pick,
>>> >based on other parameters, which practically means
>>> >"user has no preference on this param". Driver can only find out
>>> >after boot, when it reads the runtime capabilities, but still
>>> >this is a bug, by the time the driver reads this (in devlink), the
>>> >default value should've already been determined by FW, so FW must
>>> >return the actual runtime value. Which can only be one of the 
>>> following
>>>
>>> I don't think it is correct to expose the "default" as a value.
>>>
>>> On read, user should see the configured value, either "full_csum" or
>>> "l4_only". Reporting "default" to the user does not make any sense.
>>> On write, user should pass either "full_csum" or "l4_only". Why we 
>>> would
>>> ever want to pass "default"?
>>
>> FWIW I agree that this feels a bit odd. Should the default be a flag
>> attr? On get flag being present means the value is the FW default (no
>> override present). On set passing the flag means user wants to reset
>> to FW default (remove override)?
>>
>>> Regardless this patch, since this is param to be reflected on fw reboot
>>> (permanent cmode), I think it would be nice to expose indication if
>>> param value passed to user currently affects the fw, or if it is going
>>> to be applied after fw reboot. Perhaps a simple bool attr would do?
>>
>> IIUC we're basically talking about user having no information that
>> the update is pending? Could this be done by the core? Core can do
>> a ->get prior to calling ->set and if the ->set succeeds and
>> cmode != runtime record that the update is pending?
>>
>
> Could work if on GET driver reads 'current' value from FW, then it should
> be simpler if GET != SET then 'pending', one problem though is if SET was
> done by external tool or value wasn't applied after reboot, then we loose
> that information, but do we care? I think we shouldn't.
>
>> That feels very separate from the series tho, there are 3 permanent
>> params in mlx5, already. Is there something that makes this one special?
>
> In mlx5 they all have the same behavior, devlink sets 'next' value, 
> devlink reads 'next' value. The only special thing about the new param
> is that it has a 'device_default' value and when you read that from 
> 'next' it will always show 'device_default' as the actual value is only
> known at run time ,e.g. 'next boot'.
>
> I think the only valid solution for permanent and drv_init params is to
> have 'next' and 'current' values reported by driver on read. Or maybe 
> go just with  'set' != 'get' then 'pending' as discussed above ?
>

The driver reporting 'current' and 'next' makes the most sense to me. 
'pending' would just be implied then. The 'set' != 'get' then 'pending' 
approach would not work on my multi host CX7 system, where rebooting the 
hosts individually does not trigger a fw reset.

To be clear, are we willing to go forward with treating swp_l4_csum_mode 
like other permanent params in nv_param.c in this series, and then defer 
the 'pending' solution to another series?


