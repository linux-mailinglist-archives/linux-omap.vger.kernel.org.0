Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71862F0CE3
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727375AbhAKG14 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:27:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727210AbhAKG14 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 01:27:56 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C75C061786;
        Sun, 10 Jan 2021 22:27:15 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id n3so7775755pjm.1;
        Sun, 10 Jan 2021 22:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3YS8jXXOetKdy/hQYVRGgaxhQTXUjdocfmteRz2fdKc=;
        b=Hd/exHmmCgDs+G4lPnV6Zh0us/sExMWKy2/uptV0zc9JsLLa7nukfgx+uSavxzcBfV
         yuTpn2AHzr/TmT3YpNJNGUhdXW/xUVj405hJpu2xpKjuXqKjYSIQDtqanSHAh4BzstTX
         CZKw5pjpqYHSnkDMsjihHhDtkGUtC2Ief9uVUDOkig2l9ymIedFPfu6a6XQ8CYyQo+IW
         V2XnNXDS5oW3QT9ZZg+LyNnMJFOotgezsQFO3xNjBPCCsQ/5rVa0KLylbc1GSMLQHhhp
         iQyrBW1CFza/iM7dk/4JIwndnrupQ0bXZ9KQZgVKqmgkSG564bsRe358OXe6rLQqggwU
         aVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3YS8jXXOetKdy/hQYVRGgaxhQTXUjdocfmteRz2fdKc=;
        b=lVIrx7G7xM9hz6S22inUUoBnO5xivb98sFaSttucfnTtC6+flNEJRyUQKUVQgRPcFk
         yBKj3N7rrMNVEy0tcYbNpua6OweB903XgxgyQey0b82u13rZ/XUjaakG0wv5eLLkp4SC
         EuaYfy0XRbX5gKI/B/oF5JvwLB49vklvnQe+y9kCqkwAAVrY3/GeUw8N/Ht3c1sDnVXt
         FHtQl6EBeYeb0sWYaBY40pIE+YsB3wFwbS6JaHabEOg/zWiv/3JJDM3iDRsaM85ecAo9
         uQxx3Gc3Bvg6NkDBt9KyulwNQg5RsiFf0XTl6uDRq/zxEnQIp35oZH4IDEOX2nxhSj+Z
         3NDg==
X-Gm-Message-State: AOAM532pJ98Eh7oJ+sUYpj6VYdCQUsRdUWQIM7q9sqozrEZSjm7qknN2
        6HGBrZ4KRknTT1nvt1z7VCM=
X-Google-Smtp-Source: ABdhPJxpE4i2hbSgXUPIZ6UArXBNFb3M0Ds/XBaxqQAnx8z6kYFpiSn1zZ747kaNcaIngXQyCH+d4g==
X-Received: by 2002:a17:902:59dd:b029:db:cda3:39c0 with SMTP id d29-20020a17090259ddb02900dbcda339c0mr18201897plj.81.1610346435426;
        Sun, 10 Jan 2021 22:27:15 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n4sm17302164pfu.150.2021.01.10.22.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 22:27:14 -0800 (PST)
Date:   Sun, 10 Jan 2021 22:27:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 3/5] Input: omap4-keypad - move rest of key scanning to a
 separate function
Message-ID: <X/vvwKh3q+oLu14t@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-4-tony@atomide.com>
 <X/vZJMAOJc/CzmHH@google.com>
 <X/vo03Hd0sJFou3h@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vo03Hd0sJFou3h@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 11, 2021 at 07:57:39AM +0200, Tony Lindgren wrote:
> * Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 04:50]:
> > On Sun, Jan 10, 2021 at 09:05:27PM +0200, Tony Lindgren wrote:
> > > Let's move rest of the key scanning code to omap4_keypad_scan_keys().
> > > We will use omap4_keypad_scan_keys() also for implementing errata
> > > handling to clear the stuck last key in the following patch.
> > 
> > And this one will become then...
> 
> Yes great, this works for me.

OK, thanks, applied.

-- 
Dmitry
