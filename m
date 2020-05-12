Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763CA1CF963
	for <lists+linux-omap@lfdr.de>; Tue, 12 May 2020 17:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730841AbgELPhi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 May 2020 11:37:38 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34017 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbgELPhi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 May 2020 11:37:38 -0400
Received: by mail-oi1-f194.google.com with SMTP id c12so17589927oic.1;
        Tue, 12 May 2020 08:37:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PCyVx6YxchGHNw6iJ+ojabd2z3U8e+KigXbn5+BW+HM=;
        b=J03VJ5/SPvSQt6f1Fe4ytraUMBwkvGTlYPlMlAa5Ku37lufCQmN6H9RrgpCqvoV4wf
         R8hK3NienpuGlXrKdRmn3Of/7EY7UaST8nLpdrMDc62u9fT4841pzHzFeVWro+OpG6VP
         Sj1XDF0V3IFRoSrSsHGr/wUZe7lLfZVHkn4CfUuYKtl4yJoyCPUdsT59nktftw50o8zI
         K6g1+f2rlsL70j4HUOAJt4uM230h66WTurd6LPbm69hBWtuapq3uH28NwrlD/feNZUHM
         fO0KXmT6JD7YXl8OlbyY44TjOZQ3qv9A5n5BmIswye6NnCz8mdFbT9xM6K+miQc0Ntvv
         o8bg==
X-Gm-Message-State: AGi0PuaRsrfhYd/8KL/c4ezFtEXxS6/muTe+tGilr1MA4Aq+xGn6vDwG
        vcnPRKpcoKaTn99Ng3kxUA==
X-Google-Smtp-Source: APiQypKNT+mcx7T9+iUMFNsVArR3hQ4oj99NzmMx2VYonYzt1n3FPZS5ZEefObr7Lq8RTsR/f9TlMA==
X-Received: by 2002:aca:7504:: with SMTP id q4mr23486434oic.31.1589297856746;
        Tue, 12 May 2020 08:37:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i81sm424098oif.26.2020.05.12.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:37:35 -0700 (PDT)
Received: (nullmailer pid 24510 invoked by uid 1000);
        Tue, 12 May 2020 15:37:34 -0000
Date:   Tue, 12 May 2020 10:37:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        linux-serial@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: serdev: ngsm: Add binding for
 serdev-ngsm
Message-ID: <20200512153734.GA24449@bogus>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-3-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 30 Apr 2020 10:46:11 -0700, Tony Lindgren wrote:
> Add a binding document for a generic serdev-ngsm driver that can be
> used to bring up TS 27.010 line discipline with Linux n_gsm support
> on a serial port.
> 
> As the Motorola Mapphone modems require some custom handling, they
> are handled with a separate compatible.
> 
> Let's also add vendor string for ETSI as we're using a ETSI 3GPP
> TS 27.010 standard.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../bindings/serdev/serdev-ngsm.yaml          | 64 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
