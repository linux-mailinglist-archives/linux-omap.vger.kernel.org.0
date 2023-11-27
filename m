Return-Path: <linux-omap+bounces-36-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396B27FACBB
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 22:43:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E761E281CFF
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 21:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C3546538;
	Mon, 27 Nov 2023 21:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA0994;
	Mon, 27 Nov 2023 13:43:40 -0800 (PST)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1fa1bcf1d01so1656730fac.0;
        Mon, 27 Nov 2023 13:43:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701121419; x=1701726219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9Cgm2ZoD+0eC1FSykkSRJaHxJ8q+ueSJp9LljMAwes=;
        b=NPbPirErgzJ1G4otFphD/CtD1MsiKjC8JxYErI4CAYJZvO+at/4UnY7niZHpK62hwT
         vOr9I533Mp9y12hdxWkp/uXs8TWzdr/EKTHzxgndaeDbfEZdd16zvl2IRsufux9DNMs+
         yKR++mLFT5hp1VzALnhV7+GidwyjMNCKFnpDLhxhAgdCscHuUGS/aXGskuRuNDfOQrwL
         vRw18ZhCM3w4IHEAXBKie1UVeu+Ug2TBHeLHNppoS0gK0yQWW5XbMygv2tKuidmcoqPy
         /9HeYpXdpnGVQGhPpPgyRP3GEXWdEWQS2dUs02mZ3CQwKcJ2x1Fk2UlUB6xGrUq8NNV1
         aKtQ==
X-Gm-Message-State: AOJu0YzuO4t6vC/Yf5rR7x8jtEkuTXggBbj1Axe7OcSniNUozYUHcnCh
	+PUUtXsye1rpXrWbs6t4WA==
X-Google-Smtp-Source: AGHT+IFHz4QMpzoeTNrV9MvcCtMYMj0FDo5EBpJHYTCFH0emTeU1w7XWYC8jO3JlmcoieKycsdMbDg==
X-Received: by 2002:a05:6870:6b07:b0:1fa:cdc:2832 with SMTP id mt7-20020a0568706b0700b001fa0cdc2832mr12051404oab.13.1701121419391;
        Mon, 27 Nov 2023 13:43:39 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id du45-20020a0568703a2d00b001f9e460c816sm2232046oab.42.2023.11.27.13.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 13:43:38 -0800 (PST)
Received: (nullmailer pid 3822458 invoked by uid 1000);
	Mon, 27 Nov 2023 21:43:37 -0000
Date: Mon, 27 Nov 2023 15:43:37 -0600
From: Rob Herring <robh@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Cc: =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>, linux-omap@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>, Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: omap: Add Motorola mapphone mz609 and
 mz617 tablets
Message-ID: <170112141717.3822398.6435394653861106229.robh@kernel.org>
References: <20231125094248.43537-1-tony@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125094248.43537-1-tony@atomide.com>


On Sat, 25 Nov 2023 11:42:45 +0200, Tony Lindgren wrote:
> Let's add compatibles for some xyboard tablets, these are similar to
> the mapphone devices already listed but with different peripherals.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


