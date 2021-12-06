Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAB146A6CC
	for <lists+linux-omap@lfdr.de>; Mon,  6 Dec 2021 21:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349704AbhLFUZN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Dec 2021 15:25:13 -0500
Received: from mail-oo1-f46.google.com ([209.85.161.46]:33690 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349694AbhLFUZN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Dec 2021 15:25:13 -0500
Received: by mail-oo1-f46.google.com with SMTP id r18-20020a4a7252000000b002c5f52d1834so4736058ooe.0;
        Mon, 06 Dec 2021 12:21:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i3wfqJfvtxxPeW+EmQNpuFXSEkdc7MdnZNlSSCFz+3A=;
        b=jidbmAozRKx1CX6aoOXLeHymqySbXutE7O4ivkYcEdwxfiuczWKpP3B7vZcvlCnY7Q
         E7VlCBrQl/DKiiHrgR34ZAg5h3VE8jqFCxN/AE8rle26J8PiY6XaNGJJzUM96s4EqvZk
         2ROTWdpmJiImS6ha69B1a7nCuJKSHdfYN0cta8tLbN6CvpIXZobJp3tUrw1fEEF8jViD
         //p78OXMUosiazCFHLFdDN2SOF7O6iL3cX3wVCEvFV5cMzdMFxQ2ZSnyyMXY/1LXqtrJ
         T1n7Chq4Vs+98El/ojsWc4FTCxtkV7iHF2jLP53EKuWv+Cnqk+fqfXAdektpXjzYkSTj
         e54Q==
X-Gm-Message-State: AOAM532zZ7vhEev25xGJDXPWo24ztId24XOX5DsHQPxGEvfIm/sRbPxn
        sJeKBmzbHa+LY2yN//TgU7EyUHNg7g==
X-Google-Smtp-Source: ABdhPJw7ZlsABLKOKoogFUD4GYQqy/6qBhGrhSTHV1/r2wTII0ekvX3LXpNmdVinCpYEJHHX7i3OcQ==
X-Received: by 2002:a4a:245a:: with SMTP id v26mr23892741oov.67.1638822103685;
        Mon, 06 Dec 2021 12:21:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j10sm2302334ooq.5.2021.12.06.12.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 12:21:43 -0800 (PST)
Received: (nullmailer pid 2520352 invoked by uid 1000);
        Mon, 06 Dec 2021 20:21:42 -0000
Date:   Mon, 6 Dec 2021 14:21:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Use correct vendor prefix for Asahi
 Kasei Corp.
Message-ID: <Ya5w1kDmClgg6ePM@robh.at.kernel.org>
References: <20211206144802.217073-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206144802.217073-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 06 Dec 2021 15:48:01 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The old "ak" vendor prefix that was never officially accepted was still
> being used in some examples. Convert to the correct vendor prefix (i.e.
> "asahi-kasei").
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-gate.yaml             | 2 +-
>  .../devicetree/bindings/iio/gyroscope/invensense,mpu3050.yaml   | 2 +-
>  .../devicetree/bindings/iio/imu/invensense,mpu6050.yaml         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!
