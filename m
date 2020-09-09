Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF38926379E
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 22:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgIIUmo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 16:42:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36345 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgIIUmn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Sep 2020 16:42:43 -0400
Received: by mail-io1-f65.google.com with SMTP id d190so4705349iof.3;
        Wed, 09 Sep 2020 13:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qS0iL/1BnDuiLSOJMzUJoul18U+vyJy2vxDhZrRHbiw=;
        b=o5TBkD8XhrpXOL4c2+ihmXVQ0pyZ+a/e9jg9KsTDaZ6bVaMRFA/6XIB+jP+tjVSbos
         0fWNcSn4gQ1CMregjC61Y7OXxa1O1nrz+61iiVdRkGI88q5dtg8tBgPpFSwlt7oC8PGP
         W5ev/WFGmtHzszJ4DANUT1V02fGtdtN2G5CiRz1f/Rb6LIAAGB/aiPLIf19Je2sbVDt3
         2y18SZzT2cDyYCc2OctDga6rVkTORS9Iuy003I7U6j8oQmsZAhZ9Xd4ZdTd9PhiF3mCh
         3dRo/5ItsuI8LtTYEcYzznuueOdrTVbfvVopzye9gNaH8oVEomf+l+bKfrjLQ27DdAVH
         Qksw==
X-Gm-Message-State: AOAM533as84HqhPjbLfmlqLRDv8osiQ6XVv6lDM/W1jm5n4NHRRzLUKB
        xEAv8gwEkgLg1fP/JSFcDw==
X-Google-Smtp-Source: ABdhPJx6o/5NfjDTApFRgKU5kkVBxXf3w+Ug7nCqbe1SYMi9Dx3JvJETiYpXb5LiMV3hTnhmyfQWSA==
X-Received: by 2002:a02:c8c6:: with SMTP id q6mr5690115jao.76.1599684162200;
        Wed, 09 Sep 2020 13:42:42 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id z72sm1729029iof.29.2020.09.09.13.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 13:42:41 -0700 (PDT)
Received: (nullmailer pid 3043573 invoked by uid 1000);
        Wed, 09 Sep 2020 20:42:33 -0000
Date:   Wed, 9 Sep 2020 14:42:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: hwlock: omap: Convert binding to YAML
Message-ID: <20200909204233.GA3043505@bogus>
References: <20200828041447.5900-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828041447.5900-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 27 Aug 2020 23:14:47 -0500, Suman Anna wrote:
> Convert the current OMAP hwspinlock binding from text format to YAML
> format/DT schema, and delete the legacy text binding file.
> 
> The new YAML binding conversion is a slightly updated version compared
> to the original. The legacy "ti,hwmods" property is now obsolete and
> is dropped altogether, and the K3 example is updated to showcase the
> actual dts node usage.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Tony,
> 
> Only warning with dtbs_check is on dm816x. What's the plan for
> converting that platform to ti,sysc?
> 
> regards
> Suman
> 
>  .../bindings/hwlock/omap-hwspinlock.txt       | 41 ----------
>  .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 76 +++++++++++++++++++
>  2 files changed, 76 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/omap-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> 

Applied, thanks!
