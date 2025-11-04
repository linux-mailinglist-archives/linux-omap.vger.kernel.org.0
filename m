Return-Path: <linux-omap+bounces-4835-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1AAC3196B
	for <lists+linux-omap@lfdr.de>; Tue, 04 Nov 2025 15:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602A43A2A56
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD1632E752;
	Tue,  4 Nov 2025 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="2MnCpc1K"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD041FF1B4
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762267206; cv=none; b=Uit/WprhjM3WTepVOB1fjiiMLiji1M8loNpUlZUULHJYChGWN2j+dlqDJzozEwWMp4dim2Xx9Ybbgozw/tEl7JwnPodhBvNpeJ60Tqqon1HVf2oU0IsKVSQI00BeXjEgNZWUix92douvafyJRQ9UCPBPc7u1bUBEbe+cqp3wEtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762267206; c=relaxed/simple;
	bh=ZsrPvleOI3xxeiQePS3/NpD1qyrQbrxTc8ZEeW2EnYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3GPwwF/VCDXLX6afbdxLU0pyr9ufCrzC4Rz2tsju6/5LUzKj+rV1LQx73QWD3CAhV8SiQgY+NmrmTGbv/DHWhDH5E7Kg1rsHAylOikwgdCw93StG9nDY+naL6KSnysB2ugklSNSi/8U8SRmF3gsu38LZxQlvl76zAEKEjoV6Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=2MnCpc1K; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47755a7652eso6591205e9.0
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 06:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762267203; x=1762872003; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rEkFVWT5NBv3AWUofiDX8hOm3L/6oD6jZrSiQV9+dPY=;
        b=2MnCpc1KYsJrOEdIyvwTisGdFiQuVqXmpc1WZErYJNmqxwTnfqYA54Ttfybi1d0PvI
         yAukgegu/2jJDatfU1C0raa16Mf0YercoXFgtgYZ5d9oDYQdrsFDQAn60kaOic39W8Ea
         N6CAKwemTNPaAUUN7gSOZGitxre0qm3hjPVA6i+n0TIM4jAMJWZ+rdPJJ2QzepzxJCeF
         k3l4DBiDB47poDRUHlSgMfe2gTTPv258dFM2+NPMXK9+ciCmIS8+gdrzwkenie1wIbSC
         0fno23PnaWTBZZ9555pWUVQKPtiUCdQaLhThO2mWEFHoASnHonksnbu6CMykeO4CKIX4
         oi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267203; x=1762872003;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rEkFVWT5NBv3AWUofiDX8hOm3L/6oD6jZrSiQV9+dPY=;
        b=wBf4np1SAdXYNM5AA97KTd/5SzaGYUR0l/0W7vITlkA1/waN1oB7anNvrqz9al9d4O
         V/ySer0NpQIqVh+giDB1uJJjbmQcDfggVxYtVqv+RmJ9boypw2Tb+g8cZRc2pdzz/IXY
         6B4HhJjbyaarhbIVl1x5baASGZg3GdhzLs9wzJTW8m8eDKBwtNJ8RRxGce5Fp55wIbWN
         vZOlZ1ArAkMl/s0BhOSjbd9qeU/TtwzHvaHU+73qHvRWk4+25hH/0y6BmE2RvXgudSKx
         84DOHQWM+tOPPKcHkAC+2wM9QvFdMpZ5pMIc6h/6DEXhWNxU8rFDoj/D4nymJUFwXN7G
         xSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtvJsS1qfvQjg2GE/wR07RWnBZKNNrcoCACQmClI9HssN2r+/3G9V++8m3MbP3bPVMqieOgoldaYfw@vger.kernel.org
X-Gm-Message-State: AOJu0Yyri3yPjbkg65t0+o2EaQdCGW6vDsE59BOM/lLyr7Kv3uYWFqsi
	CDWyTFb1RTzzKh+MybskKV1KbLAo/ZEz0KSABxQspE5E9Yh9RQPeAKekCWcabbSGeHM=
X-Gm-Gg: ASbGnctBpTPss183KiJ2UFp1GNFe/ziNz2jVWQppH7BCJTsXd+9c7W0jArlr6l4REAM
	K27oUPRKz5s+wOWbeIOlvpgdVlhv7hE1CzC0W3ThUw5UaKM5yl0/PzNkyKUmbPQnb2+MJQQxhS4
	Z0e7eZufurF7UvetdbxH0C39J+EyqNOUhzjmdXQuvWcZOO+ohJcV2c1u1jPxCGa0lDpHu+X1msO
	yLTWL8jdi5m+lEqaAwcmqq5/2lcSm8/eQyqtCMJI1LlKhALuYaQFgyImpk0VDa/fyn2RkmSS6XZ
	EQT2Bge50YQ67KluXo/rG1320Un0hPHcEh+sWH9hoGWfN4cPtr7wW2ERsw6z8abcAYKLV4RRL5l
	4iPfc25cnUJGYyVD3a0EpXqph9D3oUKFDjnLvTADV114mWZx/g9+waZIgezhznV0oZLAcTdJXn0
	gLGqqs85OD
X-Google-Smtp-Source: AGHT+IH+wSpO7CA7uoT1EyqMsmESkKjEBIh7MZyEYgnZ6s42MxUO4LQk7aoyZId0Y8Jc8HF2ped2Fw==
X-Received: by 2002:a05:600c:1f8f:b0:477:58:7cfe with SMTP id 5b1f17b1804b1-477307e4885mr128649795e9.18.1762267202870;
        Tue, 04 Nov 2025 06:40:02 -0800 (PST)
Received: from jiri-mlt ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47755932134sm18947015e9.14.2025.11.04.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:40:01 -0800 (PST)
Date: Tue, 4 Nov 2025 15:39:54 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Michael Chan <michael.chan@broadcom.com>, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Loic Poulain <loic.poulain@oss.qualcomm.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, Aleksandr Loktionov <aleksandr.loktionov@intel.com>, 
	Dave Ertman <david.m.ertman@intel.com>, Vlad Dumitrescu <vdumitrescu@nvidia.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v2 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
Message-ID: <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>

Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>
>
>On 11/4/25 6:38 AM, Daniel Zahka wrote:
>> 
>> 
>> On 11/4/25 5:14 AM, Jiri Pirko wrote:
>> > I did some research. 0/DEVICE_DEFAULT should not be ever reported back
>> > from FW. It's purpose is for user to reset to default FW configuration.
>> > What's the usecase for that? I think you could just avoid
>> > 0/DEVICE_DEFAULT entirely, for both get and set.
>> 
>> I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>> observed this same behavior when using the mstconfig tool for setting the
>> parameter too.
>
>e.g.
>$ dmesg | grep -i mlx | grep -i firmware
>[   10.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1006
>
>$ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSUM_MODE
>
>Device #1:
>----------
>
>Device type:        ConnectX7
>Name:               CX71143DMC-CDAE_FB_Ax
>Description:        ConnectX-7 Ethernet adapter card; 100 GbE OCP3.0;
>Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Boot
>Device:             01:00.0
>
>Configurations:                                          Next Boot
>        SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)

This is next-boot value. You should query current (--enable_verbosity)
to show in param get.

