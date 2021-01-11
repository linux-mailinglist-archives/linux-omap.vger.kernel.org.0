Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528072F0CE0
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbhAKG1M (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 01:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbhAKG1M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 01:27:12 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08654C061794;
        Sun, 10 Jan 2021 22:26:32 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id v1so7182720pjr.2;
        Sun, 10 Jan 2021 22:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vE5yVXmI0p58JfuHdkxmSRmwci6qztqM/4kHBAo9nqM=;
        b=SN14O9EPYNylTfPgwkkmV+0KEt+NSgp7Ta9uxYZmMlm+JTWeT7s/j1yzQVFPfiEQNc
         Vv6frtV2b9qkjrJ4lFlx8xXZZ9+qYVevzkS1Sp2ouvdk3rETiKFnJXqMYyac61IcCQmI
         sHX474SAxlwyLV7f8PnEdBu905NT3ydnJhIm0X7AQDe4ox1yvVX5WFjdM24lw2uNelfc
         etcQe8WXzpJyrdmLVU8ZFm0qDD2PNQTXMiFR1X16+Jj6kiHPsqzawNo7h8bhJp+oSbcP
         xgQJjjTqXNr+K+iSghGbMN9h7A8nmGslrDaUzt8hJfquacdcqKqnZNN2u2jlZgxX0xGZ
         s4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vE5yVXmI0p58JfuHdkxmSRmwci6qztqM/4kHBAo9nqM=;
        b=UtkcPGWNDJ0mBlCcZ7RgkV2SkmZx5YT5nzDHC4r6dHBAghVqG5iZLQ6IqOLaMQPdD9
         FCFZYGX2qweSkkrdf92jBKyR9EvUhK6m4hEnkzns2DGZ7a9OFL3kUnc4qY9ESCCn/mNC
         orqEfXZg1MLReHaVFk8OgotL6hLgpL29SODflolX9R9rMPquB/ROj3x7kgSyr+8fvth/
         lNWFoxcuHlcNL89uUInohUH026g5GYgZ6ll9OIok1rCE2uAgVW/Rk4+5x46DE+wzMIFJ
         R2FyARXzszlR9C9kY+UxgWrsuPi7iwvvj6Q3mLumtdeit1OWv7k+uqFB+nHqOLQ7gdWc
         AzWA==
X-Gm-Message-State: AOAM531snFrbGrgnmKmripC+fCXZzUy6R3yd6Br0GsaUCDeDqVO5FIV9
        LS2NJ6Ma8I7db7U3CuLXGO4=
X-Google-Smtp-Source: ABdhPJx4zLXK0Kb3JGiVlu/d/+x53Xal9OoRrl5Y3gI2D2jQGb06QAnqgTsp+jIq+VvpdQGbtxb4jw==
X-Received: by 2002:a17:902:830a:b029:da:df3b:459a with SMTP id bd10-20020a170902830ab02900dadf3b459amr18417551plb.75.1610346391596;
        Sun, 10 Jan 2021 22:26:31 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n195sm17924082pfd.169.2021.01.10.22.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 22:26:31 -0800 (PST)
Date:   Sun, 10 Jan 2021 22:26:28 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/5] Input: omap4-keypad - scan keys in two phases and
 simplify with bitmask
Message-ID: <X/vvlJ3mGsFKA3zo@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-3-tony@atomide.com>
 <X/vYsc19ltOYafQb@google.com>
 <X/vopuwCgxGxoVXs@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vopuwCgxGxoVXs@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jan 11, 2021 at 07:56:54AM +0200, Tony Lindgren wrote:
> * Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 04:48]:
> > Technically speaking, userspace is free to accumulate the events until
> > it receives EV_SYN/SYN_REPORT event and process the events in the event
> > packet in order it sees fit. So to achieve what you want, I think we
> > should issue 2 input_sync()s, one for the release block, and another is
> > for press. I think we can also simplify the code if we pass into the new
> > scan function exact set of keys that are being released or pressed.
> > 
> > How about the version below?
> 
> Yes that works nicely.

Excellent, applied, thank you.

-- 
Dmitry
