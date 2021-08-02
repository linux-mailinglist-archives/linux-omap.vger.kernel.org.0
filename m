Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C08B3DE071
	for <lists+linux-omap@lfdr.de>; Mon,  2 Aug 2021 22:10:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhHBUKv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Aug 2021 16:10:51 -0400
Received: from mail-io1-f47.google.com ([209.85.166.47]:37487 "EHLO
        mail-io1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbhHBUKu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Aug 2021 16:10:50 -0400
Received: by mail-io1-f47.google.com with SMTP id r18so21770730iot.4;
        Mon, 02 Aug 2021 13:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gikjOiO4H1nc2cQpUCBf40RVNhjFrx+ABQnwAlk4JKw=;
        b=hFLowbEnTdVfaRVtvGWD6NTaR2XT61iufprS/gdQnxrck4pne0vS2k3tMWSaaDRosj
         ANYWu4ria6G0gOvmiIvcWQ7HxcAgzynErv9uqd3zzuQKONF58+hogo9glPt5cM4bk5Sp
         q4ubyA26pPE7HIddmj/++IItS2/iIdG9shAGfD+4v5zII6QDNY6+vPhDtCh3h21eopAi
         11M9ZOOcdaiMZ0t1Kk43FTX15byY1nqEWYO2b0ZWp4i7/XystcdbN2+pTEHwyvHMVf9e
         w9LGucPL60F1hKrPGKlRlPmqLPaI+h3zk8/QTNXBMLhRQ5xHEy+B7rV/i2aKwcZGaL5t
         mmGA==
X-Gm-Message-State: AOAM532igXb+t9TA9lBEseatakHXj7c+pf8s1bQis0S3bFf6g8VoBqaK
        qmLq4/OgCySikz7ExEN8hIRWmgkn6Q==
X-Google-Smtp-Source: ABdhPJzBB/Uf6MsOrRmpHsMXZBZohaVYGPn2oh2WpXqDupVWlTVWB0zFsu7LzoCzaovatBfC9oyGlA==
X-Received: by 2002:a5e:9901:: with SMTP id t1mr186303ioj.5.1627935039117;
        Mon, 02 Aug 2021 13:10:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p7sm6099859ils.24.2021.08.02.13.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:10:38 -0700 (PDT)
Received: (nullmailer pid 1522995 invoked by uid 1000);
        Mon, 02 Aug 2021 20:10:37 -0000
Date:   Mon, 2 Aug 2021 14:10:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: serial: 8250: Update for standard
 overrun-throttle property
Message-ID: <YQhRPVQ0bbE8T+hf@robh.at.kernel.org>
References: <20210727103533.51547-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727103533.51547-1-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 27 Jul 2021 13:35:32 +0300, Tony Lindgren wrote:
> In some cases we want to specify overrun-throttle like other 8250 drivers
> are doing.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  Documentation/devicetree/bindings/serial/8250_omap.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
