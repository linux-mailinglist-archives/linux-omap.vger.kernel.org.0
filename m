Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 816DA389A54
	for <lists+linux-omap@lfdr.de>; Thu, 20 May 2021 02:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhETAJy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 May 2021 20:09:54 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37648 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhETAJy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 May 2021 20:09:54 -0400
Received: by mail-oi1-f178.google.com with SMTP id h9so14802629oih.4;
        Wed, 19 May 2021 17:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LA4RgeyD3HBeU9haOJcHqZbHzNulNwVKdsYPjskFaXI=;
        b=P1ohxCDIQdi9TlfS5aJKUlRR4cvw+pPVw9tc54mGScgfnk2oeS2PT+eQ8rzLkawBEV
         ux02KTVSomRAIZ0Phr8Ak5EsmvG5UFMUlYZNEGgeahQvGBIYj59aRFsGyOOtOKMkUQ1g
         n8BRD3qjmU5vK7v21rWzg2wB/A7oFtHKewRUuRViHc9tQp875QeNmqTAeTx0en6eC7tX
         kCjq5SFvJWdhfT0cltraos+xytqier/X2exymHQHPgfOLU/w1D1zwQS7/FAkTnWtx7ZY
         ps99+1CZlxAQBsL5SFydUVqdApr+ikkn4Eno+tWQVIw8iMsRcVAwK2ZIVHjVS7aWXG4H
         jRog==
X-Gm-Message-State: AOAM530icYAJHGkM2d7LRslCG2ZAGJa0yfpeGfhQ2/Psw/wWBrM1ZmLe
        zFDJskTCYvXzl4JbCp9jjw==
X-Google-Smtp-Source: ABdhPJwo9+35nzzqwNWun7jp8klMbqnND6YGdhcLUbjnrU4T1+etIuW7axuQ8uah2B1e9vHTdZ/AKw==
X-Received: by 2002:aca:1e0c:: with SMTP id m12mr1470259oic.100.1621469313361;
        Wed, 19 May 2021 17:08:33 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x5sm261513otg.76.2021.05.19.17.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:08:32 -0700 (PDT)
Received: (nullmailer pid 3931357 invoked by uid 1000);
        Thu, 20 May 2021 00:08:31 -0000
Date:   Wed, 19 May 2021 19:08:31 -0500
From:   Rob Herring <robh@kernel.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jassi Brar <jaswinder.singh@linaro.org>,
        Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mailbox: Convert omap-mailbox.txt binding
 to YAML
Message-ID: <20210520000831.GA3927464@robh.at.kernel.org>
References: <20210518172022.10562-1-s-anna@ti.com>
 <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c666919f-cc10-3ca5-a1e3-5062c260e827@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 19, 2021 at 10:14:14AM -0500, Suman Anna wrote:
> On 5/18/21 12:20 PM, Suman Anna wrote:
> > Convert the current OMAP Mailbox binding from text format to YAML
> > format/DT schema, and delete the legacy text binding file.
> > 
> > The new YAML binding conversion is an updated version compared to
> > the original. The descriptions for certain properties have been
> > improved to provide more clarity. Constraints are added to the
> > properties 'ti,mbox-num-users', 'ti,mbox-num-fifos' and 'interrupts'.
> > The 'ti,hwmods' is a legacy property and is retained only to reflect
> > the existing usage on some older OMAP2 and OMAP3 platforms.
> > 
> > All the existing examples have also been updated to reflect the
> > latest dts nodes (ti,hwmods removed from OMAP4 and AM33xx examples,
> > and interrupts value updated for AM65x SoCs).
> > 
> > Signed-off-by: Suman Anna <s-anna@ti.com>
> > ---
> > Hi,
> > 
> > This patch does fix a number of dtbs_check warnings seen around OMAP Mailbox
> > nodes with the latest kernel. There are few left-over warnings when just
> > this patch is used on v5.13-rc1 or next-20210518. I have posted a separate
> > fix for a warning on TI K3 SoCs [1], and will be posting a separate cleanup
> > series for OMAP2+ SoCs. The dts patches can be picked up independently
> > of this patch.
> 
> FYI, All the dtbs_check warnings will be gone with [1] and the OMAP2+ cleanup
> series [2].

Nice, though it is a moving target. :) Is that still true with the 
undocumented compatible checks that's been added? 

Rob
