Return-Path: <linux-omap+bounces-4833-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106DC30CB5
	for <lists+linux-omap@lfdr.de>; Tue, 04 Nov 2025 12:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C53F546062B
	for <lists+linux-omap@lfdr.de>; Tue,  4 Nov 2025 11:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F6E2C21D4;
	Tue,  4 Nov 2025 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFroZgod"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC022E92B5
	for <linux-omap@vger.kernel.org>; Tue,  4 Nov 2025 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762256309; cv=none; b=BWgv0mTaw9urbdB7+8aNz9TPd1H6XenbSpTJ6N1X5T+Ygbv841/Z2RTsg4+Yikbm2+AKXHGem9EKvz/e+ehKT1R8aTlRyooTAjNk6y4cJmDVd8ZBRgdSWr7CAM9UzkCGxosPPUpZRvxQAEhFu0AAVvJwEwXa3JLu8eQAcX+ivVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762256309; c=relaxed/simple;
	bh=hcmVkgGfZct0hY4NeXH0SYoiz18CRfDbFXFrEJ5cVuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tGFmb+CaWxqXYfUCxqcrM3aHJQPd0/s3wV7i895TL69tw1b87EZ8ZyKDagFRRR2A2SgTrQeoy1h8t6ysCSCY4+rOcSSrgHxBejGy5fFTJ/jZCgJ43kxZKEduxUykpgvCNr+4hnf4UVBiVFt8ZjI7RtfjQS6FsaisleU5/67eQM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFroZgod; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8802b66c811so51842376d6.1
        for <linux-omap@vger.kernel.org>; Tue, 04 Nov 2025 03:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762256306; x=1762861106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ty8EjZTIjoYFxQNfFxbRC87ROx45/mTNFipe8IcdbeE=;
        b=QFroZgod4D+9ziUZCoMnTggxTgRI4ChGX+nfrPa2++4cSENOO5vGBEq1rLejaZ6Yr7
         reeM973uBezYe6TyINBfumEGyR/qkZfW5X1HlqFRDN/t/tO0D/Js2AzZvpiOoNqY+KCE
         RSyBqfS2e8YICizd+JRB90ALDZfS9G4I2a7rOB1mh0om4c+xPx2qTWY8huey76tMYx4t
         fUCd9ZiV89loJbm7CZ9e+uxx8m7SELDhH9nLER4OTGR95XTRUb507GmxseVRSE/yomfH
         F8z7EXP5TlwSCkw8D2eYvL5YcdhDpo51qCeSiqLpBGbBufKS5zfW3dIJWoKHQv9AbbbL
         0gaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762256306; x=1762861106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ty8EjZTIjoYFxQNfFxbRC87ROx45/mTNFipe8IcdbeE=;
        b=rAuhKJGoOI3wzEofIAMCILzI+sE3fdZd51P5GNmgg93WyTOZ+XBVnUsSbi3j+SlLJr
         Z23ZiIlgFiEvoJ07n8NWP/u7gDPU789k6Q3NhRkCexfO8Uad5XtyjyNJCzUZYmCQnICR
         KTIaJueCQOSoUHngk8+Eeutv0jilvJKm4XCHomMbWDzNqxRG/yt3YfaTg4HLuS+v/6f9
         cDpwXmYb/DXXwX7L9+RfBk1/e0Va0N3mZUREPNT/N9HJwm+GU7EklHe/FJbu+ywDiB82
         3hkZmPdHIcgbMyUm7o2pe0LXRCMPNQpnMW/U9UPqPhIXuGggq33ExJMmwVx9EhQShgsP
         aVNA==
X-Forwarded-Encrypted: i=1; AJvYcCVeAwWYLBtqAfnpcyVDSRM5Uzy9FFRaSxDnlKHSUiDsfx2//+PVsgWk5WVjRTxDHotVexGncQwIUgUp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfbae5en2XAoFv2touXxXkuNrGd4vkDYHDQ3Ag5sJmDSH02MkV
	4vzJhpSTdMA3ssPTsC3Sla/WIrj+VLlJ57++bCj7LyvyaYafeJAJO7Jg
X-Gm-Gg: ASbGncvuLoqiv/byV1BUYb7DmQn2bGXkmOtRyvBkFX5VZDWL6il3Kc3X9kKaR0y9rvo
	ycXJ/xnJrcdAEu/HVpBoDvkcfuxoxM/BHLaicPolT3nYph9UOYX7Tmphodj+VLj8+8u/v6p3BiW
	AMX0dAjDvpi7ZNXJShf6TdsXqZ/awYgpgcd2hx8ZkWbRJypoLPB5vOI3H0RCikGjoW0smw7AXJj
	tWzB9jbbrzX9lqXSTJYla1VGxxQlyrkhmtGs09U0SVsaRFDgQrSFJ8d1tP6aPOuLyplbAgnqyTO
	UnS4XG7loxexcm+u2eugfaxNnOsUwzOjQAy0McbwNa0PyPbKSnqcQkMGOJi+nCYu/wSdklEDOKt
	yM2aFIFnHBDAwG3dGwT7vQ+b2H5LoSaiGXvvAGGpWok9fli6ZTFo4fSzwNCZrn4zhGAVOD5Tvow
	JJeTQiafGXLBrXv6idtn6Yrf6yi7gTvn8rN0AUILIQzyOAzchpNdQcgaQ=
X-Google-Smtp-Source: AGHT+IHUdWJka00diDOSm3gEz5fAX+m1eynGGsYAsxJbIC9pNdUYm3UTMBl+lsslEkQP9lwiDDKGSg==
X-Received: by 2002:ad4:5d4d:0:b0:880:54eb:f65f with SMTP id 6a1803df08f44-88054ebf940mr96218996d6.53.1762256306128;
        Tue, 04 Nov 2025 03:38:26 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb? ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88060e9566dsm19023796d6.47.2025.11.04.03.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 03:38:25 -0800 (PST)
Message-ID: <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
Date: Tue, 4 Nov 2025 06:38:23 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
To: Jiri Pirko <jiri@resnulli.us>
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
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/25 5:14 AM, Jiri Pirko wrote:
> I did some research. 0/DEVICE_DEFAULT should not be ever reported back
> from FW. It's purpose is for user to reset to default FW configuration.
> What's the usecase for that? I think you could just avoid
> 0/DEVICE_DEFAULT entirely, for both get and set.

I find that 0/DEVICE_DEFAULT is reported back on my device. I have 
observed this same behavior when using the mstconfig tool for setting 
the parameter too.

