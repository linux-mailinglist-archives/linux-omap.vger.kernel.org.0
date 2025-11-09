Return-Path: <linux-omap+bounces-4883-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F4DC43BD2
	for <lists+linux-omap@lfdr.de>; Sun, 09 Nov 2025 11:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 746773A62F5
	for <lists+linux-omap@lfdr.de>; Sun,  9 Nov 2025 10:37:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376F02D9491;
	Sun,  9 Nov 2025 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="QCy+5ifj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68EE7D07D
	for <linux-omap@vger.kernel.org>; Sun,  9 Nov 2025 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762684630; cv=none; b=pKP4hm4Z9XAxR+JBqie1OrFJHtrZ9/BU8PwVTC5RpeNS96nNuO9+ZBb6cHUTM88aeIFZ7AuHP+uuDkjdtr4D97OimwwJp0KA0vswvM0bt3B12GGBNZwjKynCgjIvwyvrO+JRoYg96KqWhy54kE4V/dkQ0GB/U/fBjAf4uSDu/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762684630; c=relaxed/simple;
	bh=lm/iZbsyFzxn5kQIG2Ub7G//rZ8rGXfD4g+y3AG04PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZX6NKIeZ+eXN85yL+aSeD4k6YNgompVCTurCZSDmGbgULoS2M9/vk3I2f8+IOSLyyP9Qr3No1ValrAcfw2YG4BxvQIyhb34VpI99HlAINTXOaVxYrZYXotBqaVlRqQ1ZVsWQqAxZ9Gw8YeU+92+f5QcmZbAoWNV9QaypRI63R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=QCy+5ifj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b72bf7e703fso376620166b.2
        for <linux-omap@vger.kernel.org>; Sun, 09 Nov 2025 02:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762684627; x=1763289427; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wLEi3FY3R8yLDeWkcJs5QaKXb4kMtZGvr5BAdfLs/b8=;
        b=QCy+5ifj8yvLmB/M4lfeR7EUrZidETntbv4TF++jiQyr5t1zS2xhuqewNmyt3k4zsA
         LoJlmyxHvXj/lCPWais4omJTA2/CHS0WqO1KiWMNLyypwGb9cdKQ6Xz721LpMqpT2V6P
         6AWKZgf2TxyAdAVthJc2No4druBPQpfmaCvGXjSjYXO9vEy/AXQqpJZ1VCskN8uKbUrJ
         0H38vG0y1nELw+QLe6OhNchMVP6SXsN1+hle/4Qbv3Bgvx72hDDmLgIUFVDJ3H6RCsAk
         oPm7KGcgpGERuIKbwf6SmZIMSNGtI73r0ylTAK/tiTos9xnxs07nBLz+Epj+MpUEdnkV
         qypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762684627; x=1763289427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLEi3FY3R8yLDeWkcJs5QaKXb4kMtZGvr5BAdfLs/b8=;
        b=iiEhbRc86OZBtR3ILPp85Jn/bbzMFu0oI6qhaPbaRdHzpt31g7dZ+3UNFxLvvRUR4R
         XRiR+u4/amTGNkrnag3syxl3DrgY8+w1GJl6PIG8ZKRexNwkpnVAlIXx/OaQIGX+lLZ1
         kVe4QV7Q1Hkc06NPF4z5ZmW+SYSQxvgueos7W/jnzg6ux+HJHEh6XLFrjFwwJ+9cRPpD
         Wv8bSTI74wBsF22FDf7+o0P7dgpQXqeTTZCGQboh03mmKOiN2HMkYvqYpbfuMFKVxpj0
         tBqYj/gkfcD21tEp0Zy2/MLP2FUB9GaLtd6TuOLbKI7hEYkemyUjbpkNm32q4T9V7iE6
         vvdg==
X-Forwarded-Encrypted: i=1; AJvYcCU/dCgz+4y1lLgW1b2zsGYRls4v5Y+Np/UmtI4E3exy42RXR9062y1gnJ2VzsMIKAsEro5vU/hupyJY@vger.kernel.org
X-Gm-Message-State: AOJu0YyCcDF1ajaVtaAxjN76KZzF/aXPGnxmDW9CsVtQS4onHrZ9dh4O
	Esvi9Z5Hm+GZJ63XixyKokcmCtXj/j9r4n7qLDSfEPkouHAb7K5umyoqeGhaiiheRuI=
X-Gm-Gg: ASbGnctqfFk0gpfIT6ZmCY5w1RlepFDTtxKxrYz0EvLnkGM+JndXEZ9DvAc3fSGu2Ri
	h6wyWO7PtY5vcAJLNvqPJ6j7QcoLoigvRbGtGuTZawsNCU9d8vjsb1cQivZSZBHWaY+X8c5D8VO
	NyVYn2hw4e3rptfbSckV6AdHwNl+AquvUfFcQMHHA+6BizccCnmvssLVhTBz3q+lh1Pjfd4oiD+
	GCX2RFvRFX6SQTK4WYH5bPwJn9zKBC+MqT2QZPEnqYD6BLza9gKe0aFO9hzcX39JtAZpuOITfnH
	83a45GEEUXMvk5v7+4gLK5dL13P9R+p5kTZkXmbGKWvS0mHRSpjGBLEX+e5vgF0SfWnW1e7bDOU
	zU9tK1GIf9tCF9NjAIieX4aT4Ku/IJY9I9EpD+jSrTmp+frJeK9XAOQsEDaN9VcXWmfQ04ZnT/r
	JMCZHs+PQ4wsODK3KB
X-Google-Smtp-Source: AGHT+IHaHIj6pMYgrtnGgyPEbnoCPcv9+h0U8aTlvRy8s+b5dWYGafxzPV9vjN/4tKYk16VfiLaOFA==
X-Received: by 2002:a17:907:2d8d:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b72e055e508mr471128366b.47.1762684626905;
        Sun, 09 Nov 2025 02:37:06 -0800 (PST)
Received: from jiri-mlt ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa0f1bbsm758571366b.65.2025.11.09.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 02:37:06 -0800 (PST)
Date: Sun, 9 Nov 2025 11:37:03 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Saeed Mahameed <saeed@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
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
Message-ID: <utjcgietdlf3jva5deqt5a6qtv7clkysth473hfa3szlwmll7l@6i6fqhem64mf>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
 <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
 <78db1fab-e482-4ebc-82ce-ba84b3f561e2@gmail.com>
 <aQ7XWOI68rVDRewR@x130>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ7XWOI68rVDRewR@x130>

Sat, Nov 08, 2025 at 06:38:32AM +0100, saeed@kernel.org wrote:
>On 04 Nov 09:48, Daniel Zahka wrote:
>> 
>> 
>> On 11/4/25 9:39 AM, Jiri Pirko wrote:
>> > Tue, Nov 04, 2025 at 01:51:16PM +0100, daniel.zahka@gmail.com wrote:
>> > > 
>> > > On 11/4/25 6:38 AM, Daniel Zahka wrote:
>> > > > 
>> > > > On 11/4/25 5:14 AM, Jiri Pirko wrote:
>> > > > > I did some research. 0/DEVICE_DEFAULT should not be ever reported back
>> > > > > from FW. It's purpose is for user to reset to default FW configuration.
>> > > > > What's the usecase for that? I think you could just avoid
>> > > > > 0/DEVICE_DEFAULT entirely, for both get and set.
>> > > > I find that 0/DEVICE_DEFAULT is reported back on my device. I have
>> > > > observed this same behavior when using the mstconfig tool for setting the
>> > > > parameter too.
>> > > e.g.
>> > > $ dmesg | grep -i mlx | grep -i firmware
>> > > [   10.165767] mlx5_core 0000:01:00.0: firmware version: 28.46.1006
>> > > 
>> > > $ ./mstconfig -d 01:00.0 -b ./mlxconfig_host.db query SWP_L4_CHECKSUM_MODE
>> > > 
>> > > Device #1:
>> > > ----------
>> > > 
>> > > Device type:        ConnectX7
>> > > Name:               CX71143DMC-CDAE_FB_Ax
>> > > Description:        ConnectX-7 Ethernet adapter card; 100 GbE OCP3.0;
>> > > Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure Boot
>> > > Device:             01:00.0
>> > > 
>> > > Configurations:                                          Next Boot
>> > >         SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0)
>> > This is next-boot value. You should query current (--enable_verbosity)
>> > to show in param get.
>> 
>> I am still seeing that DEVICE_DEFAULT(0) is read back:
>> 
>> $ ./mstconfig --enable_verbosity -d 01:00.0 -b ./mlxconfig_host.db query
>> SWP_L4_CHECKSUM_MODE
>> 
>> Device #1:
>> ----------
>> 
>> Device type:        ConnectX7
>> Name:               CX71143DMC-CDAE_FB_Ax
>> Description:        ConnectX-7 Ethernet adapter card; 100 GbE OCP3.0;
>> Single-port QSFP; Multi Host; 2 Host; PCIe 4.0 x16; Crypto and Secure
>> Boot
>> Device:             01:00.0
>> 
>> Configurations:                  Default             Current       Next Boot
>>         SWP_L4_CHECKSUM_MODE DEVICE_DEFAULT(0) DEVICE_DEFAULT(0)   
>> DEVICE_DEFAULT(0)
>> 
>
>When default value of nvconfig is managed by FW, 0 will always mean
>DEVICE_DEFAULT, and it is a way for the driver to reset back to default on
>write, but on read FW should never return it, so this is a FW bug.

What I understand is that 0 is still okay to be read back after writing
it. I don't think it is a fw bug. Also, I don't think we should expose
"default" as devlink param value.

>
>But this shouldn't block this series so just return 'default', from the
>driver perspective we should return 'default' when we know 0 means that.
>

