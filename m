Return-Path: <linux-omap+bounces-4884-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DE8C43BEE
	for <lists+linux-omap@lfdr.de>; Sun, 09 Nov 2025 11:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4894A3A82E9
	for <lists+linux-omap@lfdr.de>; Sun,  9 Nov 2025 10:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931322D8DD1;
	Sun,  9 Nov 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="n8/o6YJv"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D71F0994
	for <linux-omap@vger.kernel.org>; Sun,  9 Nov 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762684798; cv=none; b=DEgt90W54BeL0jnSzDl6HY+5efsiMnwvHjkRH4QrRSx1Klk1OUnIigQAN1WR7TCy1nGJxDsBvphVeLX0g4Ytkp0LGT5NImGuDPEzhgvXzlO7S8Emnw8AFKQikRIjnPUqfDsLntbqnoSIEUckvGE0+FtMZH3QzIV4DzOMtYaWhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762684798; c=relaxed/simple;
	bh=GWv7Yx0foUQULYjiBsrLoexN62ZpupZwV+SSKDZSTAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fm5calyMwEkESSCh7/69NhDYpyY4nR/Yun2NwGrFIHRNurgw5+y3G4JUKxVvIupjk4L+sjFhkevUC4pWVI7YmzL2UFajWTplcHGaCQhz5ZVr6RyTwvksfyhI+Z6HA6j3Qyh7t9DI886onPc5zfUghVLZEhOuYwntUrzmnWlYbyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=n8/o6YJv; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b72134a5125so305237666b.0
        for <linux-omap@vger.kernel.org>; Sun, 09 Nov 2025 02:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1762684795; x=1763289595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M9k5NU9CvPXHOQFjRFf4cyiGap0OxcUU7zGSG67KNV0=;
        b=n8/o6YJv6xt348UZQWCazGHg2q1OqiXq3gR7JRCK3HEk0scr1LCmQi+0cAJqH275+i
         lingcDtNQduxWVmM7Fa+AtnvM9hZXSiMR3ZgwutviZW3UVooqZX1HLf57+1xyfH8whOz
         ZmbHGW48qrzZyMtktbeSBrbZNcwVtdER1yTUSH8lfsrJ9mLoBcvx3czHC63wDmRySAr4
         oyaB1KhInmHOI4Zpiaf/s+m32XBRB5+Ui9GJ2GaqrvFKYw1n7jPcC3deEK4dh9y/3dbI
         zBz48Hrz1y1vQlsa1XSbEt8fF6Q/uzzNUtvS7H27e+m6pbVoSlCSBCGg+o8hbv7ELNuE
         pV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762684795; x=1763289595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9k5NU9CvPXHOQFjRFf4cyiGap0OxcUU7zGSG67KNV0=;
        b=j4irsBhHeT5qTzu5apNSqQ360LXBC/va22k2du/YdwLT3ZqMg9wNaKxmQq37nW4fMh
         sgz7vsWORmzNY1bbHO5DVOTL/mhlTAd8Eh1QQ/fcYuojsZ/qfNC8yK8Y55V1b94tNxWq
         BclKtlSHKeY+0ZXvQdegjGI03d4JRQ+iKqF5yAA/SInsmGgzCky3m+AWmC6nCe9i+UYF
         6jZ5jtAJbq23RG8EWiU7WEN//cqj+2SQx/5nitm0FTFrodXsqPbm+quGxIi+CaX9UovI
         dwikar9b7CUCnPNzc1IHFlyBefVbRfd/IkhV44blSryPO5TkeWkikJ1u3dnrUQSIhHrW
         mtGg==
X-Forwarded-Encrypted: i=1; AJvYcCVeUtPl+cWbz3jUdfdx6awv8/jVDGcj/c3Yt83t5DcNwQlq3fzljgBtbnU2rZuftNl2se9a0YhzXX+G@vger.kernel.org
X-Gm-Message-State: AOJu0YyOI8IT3dBjBCU/2iUrJDDMltfy3PIADPryTE6xwsTLQf49ApND
	WF24eiNcu4Sn0K8Fdp05vNERiHpQCPjf7UpryelD5rGFi1LqZ0pFD7ZqLW5CgeQnmy0=
X-Gm-Gg: ASbGncuVVnn8yWfaDJAwEQxlZRoAheGRukrRAVh/oi7f7XACX+nTfpjFsH02B3UFP1a
	8ZsW6oY78JIEfI56LeJ2swyLy8DwUr/S+GNNtjbo2SwSriXteAmiIwOvVkCzhGV0c0CrXRKIh1+
	gRySeEcOmW9MxAd6el81OmRjy7/Y5N5Cdzu4uft2SB5OshXFsGrCax/98oz1e/TF0UD5yjNAq2p
	kMyG7IqSuXuaZLt0/ZkQ/b6fMz70QQIszgjAY3fyNEHGtXrVcVpsXSVff+N1XlKlAE6SHg+PEDX
	0KGn8TqRO4YZbr780IXlwPFcvnlBzdGVNlGAHSlS3XJo9yuA/tDpWr345kgPKHMykjw/7qHylt5
	L7s+MiANVHI1dcOAIDBTXs3dpG0ZJr86e32NstzyFHY802MTObID8q+zOJIp9C4+Th4Rh5J+iYz
	ftvGl0CVF4lTcEQ7d6
X-Google-Smtp-Source: AGHT+IGiAUMWo+QvSERmjIIMyP89hGQRiOZTK4ZUYS5n6Hi8A+5UCIsgg27hL+sayFE1WTxmR9XApA==
X-Received: by 2002:a17:906:6a08:b0:b70:b83a:73d5 with SMTP id a640c23a62f3a-b72e0591f8dmr463037266b.46.1762684795103;
        Sun, 09 Nov 2025 02:39:55 -0800 (PST)
Received: from jiri-mlt ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d0f3sm813415066b.48.2025.11.09.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 02:39:54 -0800 (PST)
Date: Sun, 9 Nov 2025 11:39:52 +0100
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
Subject: Re: [PATCH net-next v3 2/2] net/mlx5: implement swp_l4_csum_mode via
 devlink params
Message-ID: <mfuluoi4nebyc4avj52gkfs4nqikn6uwhqnkf4o6xfswtpceuq@zhpokcx6bb6l>
References: <20251107204347.4060542-1-daniel.zahka@gmail.com>
 <20251107204347.4060542-3-daniel.zahka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107204347.4060542-3-daniel.zahka@gmail.com>

Fri, Nov 07, 2025 at 09:43:46PM +0100, daniel.zahka@gmail.com wrote:
>swp_l4_csum_mode controls how L4 transmit checksums are computed when
>using Software Parser (SWP) hints for header locations.
>
>Supported values:
>  1. device_default: use device default setting.
>  2. full_csum: calculate L4 checksum with the pseudo-header.
>  3. l4_only: calculate L4 checksum without the pseudo-header. Only
>     available when swp_l4_csum_mode_l4_only is set in
>     mlx5_ifc_nv_sw_offload_cap_bits.
>
>The l4_only setting is a dependency for PSP initialization in
>mlx5e_psp_init().
>
>Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>

Daniel, I asked twice if this could be a non-driver param. Jakub asked
for clearer definition of this know in that context.

Not sure why you are ignoring this :/


