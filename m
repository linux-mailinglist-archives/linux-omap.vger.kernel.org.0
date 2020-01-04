Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 125771300DF
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2020 06:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgADFJz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Jan 2020 00:09:55 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35042 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgADFJz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 4 Jan 2020 00:09:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so10273466wmb.0
        for <linux-omap@vger.kernel.org>; Fri, 03 Jan 2020 21:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X18W/LsPJYh5C2HwXq1c5bQUR8QbYZdM3EuKyF1GrFU=;
        b=bts1fJTwbC95FyC7zmEoNTZz7rPR4QA2PAIyQ/nJBg+BYZnm1/HPhnOvg8WFZhLee7
         YLgdpPsAX/Jzn5mXaaSztMZ5l8P2LKyfqGu68fBeUieK2ZfhxwOjZxBQOy4WB3NZNZ6h
         WL6LLvDY9goabK5H5lFmxOt6XLZS0u+Uq8u8S0pfSE+DXp4wph/mtKLkmIWkul4tb1KX
         BcajmRu7QXPvSm6XTOAUJeZzBTiP3XSVGXHWy4tAOLpTbS+Q7mRAT19D83U6q3G1d4D/
         MpxGD9kDw0uM12lsAnOGCmKNpQ7qc3viMWKF8MIEn4o9JO+cCmhvUq+2PVjXsJZeeydq
         BN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=X18W/LsPJYh5C2HwXq1c5bQUR8QbYZdM3EuKyF1GrFU=;
        b=Z65AT4Mres7PE8wJ5YgN1Z0xxg5XSM1a0b63wmD3F6aJsyZM2v6zeRScrYvZ9wdG80
         f45hu523ek3nZW38EyDVMQapduEMGJUMQECet57G+VWnAGJeMKnQhMyiNWwsWuiDicTL
         9YSZBkmtrS8k0gP+lsoazjxQSzTe6l1/i4HFTOKf5E74uHVVBNVF3WfK8eED9IGIddJI
         8DaT5kIto2OSTdByqpPXUK6J6Eb+gKPieS4cfPwidKJ4nIzubHS+Zhrl2bCdChtMpdcS
         JC3STOvfQ+lOuN9rPIKYnyqG5wcQgNgLroQbNkRQsT5IdodPxMn4P+ws0e7JVBo4kaGY
         gZbA==
X-Gm-Message-State: APjAAAV3o/wQbrNZge4s2h5xOX9z5KqLHdjIUiKITAY9/65bUHh0eWz4
        Pi88mAdhS/EjGIbfSlePacwby1LYL5c=
X-Google-Smtp-Source: APXvYqwsjceE1f+sOmXbtZqg+MxLHQtJSKYWvzR1CpCH/vQEzNSwSjmmpUQKQ+0HHQNSLzbFwSI58g==
X-Received: by 2002:a7b:cb0a:: with SMTP id u10mr22523584wmj.165.1578114593292;
        Fri, 03 Jan 2020 21:09:53 -0800 (PST)
Received: from chinchilla (dutchdutch.xs4all.nl. [80.101.94.16])
        by smtp.gmail.com with ESMTPSA id f1sm62330598wro.85.2020.01.03.21.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 21:09:52 -0800 (PST)
Date:   Sat, 4 Jan 2020 06:09:50 +0100
From:   Matthijs van Duin <matthijsvanduin@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [PATCH] drm/omap: gem: Fix tearing with BO_TILED
Message-ID: <20200104050950.GA11429@chinchilla>
Mail-Followup-To: Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>
References: <20191221005711.47314-1-tony@atomide.com>
 <20191221164141.GI35479@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191221164141.GI35479@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Dec 21, 2019 at 08:41:41AM -0800, Tony Lindgren wrote:
> Also, I'm wondering if this change makes sense alone without the pinning
> changes for a fix, or if also the pinning changes are needed.

Both pinning and page-alignment are done just to support the direct
userspace mapping.  By themselves they mostly just waste tiler memory
but otherwise don't really have much impact.

It's not really clear to me why you have such interest in this specific
patch.  Does my patch series fix the tearing issue you've described?  If
so maybe without my patches tiled memory is just so slow that the frame
is being submitted too late, which perhaps causes an async page flip
(does it? I'm not sure) thus resulting in tearing?

Matthijs
