Return-Path: <linux-omap+bounces-56-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED977FC01F
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 18:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0204EB21604
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 17:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A045B5CB;
	Tue, 28 Nov 2023 17:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410E3112;
	Tue, 28 Nov 2023 09:16:49 -0800 (PST)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6d81fc0ad6eso1815974a34.2;
        Tue, 28 Nov 2023 09:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701191808; x=1701796608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSxaWECo+SoCPkPcgpg66jWsY5n75WOX6TEqToGLZ/Y=;
        b=FU30CcjL2/BiQaBb35czzBVVXhVMh1frC3EybjFRtEEGgbxg/bOATSZtttOmy2ItBL
         AhmvbGpvxBAZj6ZwZupH2JWHGqzKSk4wdRFZqIgUYq9+UoQjDitMGV6RWh+/kcd1GGbu
         bAjA1rM9v8wwHDH/Ng7wfHgRkwZJ5OsZKMScT4XY9grBOabtZ8lgcBe2Rpuks1OK7zT6
         zFJ4qiBXhiyCggle7WtSa+njAml4RjUwgoaMXnsEho8utGhvK54RL01HhYVdTM4Vrc/0
         eemVGjZ4TKoboCHnyPrCYSQt47dZ3mL4LK/FMDU6XSmNWmO/sCaHMsNmD9uFmaAnNd4w
         zaFA==
X-Gm-Message-State: AOJu0YyRKe7RqAmOv/T9P/pENoYAWELNItVvtOWJjM/lrwldO64X8SiX
	7oYZ3ECPRiCDx0KyfMLbS6bm9LQOMg==
X-Google-Smtp-Source: AGHT+IHvVqecVFyyONprur+6eo+yl0fMCE2yoFPpWSNzy7UBUsQLpPgr1zOkPI5pjRd2ZjgqIXuGFA==
X-Received: by 2002:a05:6830:16ca:b0:6d8:2843:8887 with SMTP id l10-20020a05683016ca00b006d828438887mr8076088otr.34.1701191808521;
        Tue, 28 Nov 2023 09:16:48 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m10-20020a9d644a000000b006d81ae3d8f6sm931210otl.56.2023.11.28.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:16:47 -0800 (PST)
Received: (nullmailer pid 3522278 invoked by uid 1000);
	Tue, 28 Nov 2023 17:16:47 -0000
Date: Tue, 28 Nov 2023 11:16:47 -0600
From: Rob Herring <robh@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: mturquette@baylibre.com, sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, kristo@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Message-ID: <20231128171647.GA3343123-robh@kernel.org>
References: <20231127202359.145778-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127202359.145778-1-andreas@kemnade.info>

On Mon, Nov 27, 2023 at 09:23:59PM +0100, Andreas Kemnade wrote:
> Convert the OMAP interface clock device tree binding to json-schema
> and fix up reg property which is optional and taken from parent if
> not specified.
> Specify the creator of the original binding as a maintainer.

Great! This and other TI clocks are at the top of the list[1] of 
occurrences of undocumented (by schemas) compatibles: 

   3763 ['ti,omap3-interface-clock']
   3249 ['ti,divider-clock']
   1764 ['ti,mux-clock']
   1680 ['ti,gate-clock']
   1522 ['ti,wait-gate-clock']
   1459 ['ti,composite-clock']
   1343 ['ti,composite-mux-clock']
   1341 ['ti,clkctrl']
   1296 ['fsl,imx6q-ssi', 'fsl,imx51-ssi']
   1196 ['ti,composite-gate-clock']
   1032 ['ti,clockdomain']

Of course, that's largely due to OMAP being early clock adopter and 
trying to do fine-grained clocks in DT.

Rob

[1] https://gitlab.com/robherring/linux-dt/-/jobs/5620809910#L5618

