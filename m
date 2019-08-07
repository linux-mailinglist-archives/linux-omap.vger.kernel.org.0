Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D485323
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 20:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389158AbfHGSpV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 14:45:21 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45490 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389041AbfHGSpV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 14:45:21 -0400
Received: by mail-qt1-f194.google.com with SMTP id x22so16014097qtp.12;
        Wed, 07 Aug 2019 11:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3FBU1u876RL78FpNPM+fEUZZ2hjnifBWtf0De88VGZE=;
        b=MZtM6ZBGFwE33KRflR0oa3CBb23tUJNibReW2z8hV+PFQvDLcROCi2gyRBPe9ee6oq
         pZn6TbSj3r0ODQteFDkF1CSI4mKykNPbAiajIshMY8VzAliNvgcPXBUUGCREQt6+8Z1V
         uoq1tMl4l0ZO9Kp2qY9IGoOwb+odrfNXSq6RIRLRaR+Rg1xVi42LEnwRIXgobluBY2Yl
         qiqvH8jUFJ6YLAtQc4zO3xuLwE0Qe/iGGtjDSRfnAaXDmDRDsf69FDSYnm7CaH8JdJOZ
         HtIY+f05nKmGpuO8XMPOf0z13FI4w4jOLVqdzAzcRSRKvZyv4TNu/S1mM4sV1EBmg3u2
         tB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3FBU1u876RL78FpNPM+fEUZZ2hjnifBWtf0De88VGZE=;
        b=eSVSENR6YI+x8QsmNkRzN+nrX6oelul7VGapHxvrgesGKm5YIrTWLRMz37cZf0tYa8
         q3u/G1RERRFBTrKhd7II29fsqHMl6oNBgeLeEr+xYP1aEcRW5oBlB6mKS4dhwVSt7JuA
         b1yEjkf8a3dLjyco+5l509WtnwzcyRrMV8wMDF0bjo4EFMu0x6GDkJTAgYKfDZIhzGTa
         Jnq0/1urD/cxLMEXVJXkUrqy3i0rDf9InRwbisHzXT03+fFrEkYD7GtW+SrO0zh8Mhst
         IaKQajxZ5WmeQG/FpNuLqVHLraINqKDp7i1LtNtjS3+fgRAbTNed13aJLOr0kqNOCZee
         f3+w==
X-Gm-Message-State: APjAAAWHD3tXPCa7WUajtQu1mt7gVN5imc8b0BW+2gjZl/CNBDqNhKW5
        +e0a6OK6DyTaiwo9Szne/LA/l63O
X-Google-Smtp-Source: APXvYqwWf1dv6Cff16aig8tua7PcpEKLMe7WcVox4dHzStZsHVQ+QYcKczlV2ADG8SaLlMn6NYeznw==
X-Received: by 2002:a0c:8705:: with SMTP id 5mr9434765qvh.32.1565203520357;
        Wed, 07 Aug 2019 11:45:20 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::6ac7])
        by smtp.gmail.com with ESMTPSA id d123sm41665368qkb.94.2019.08.07.11.45.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Aug 2019 11:45:19 -0700 (PDT)
Date:   Wed, 7 Aug 2019 11:45:18 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Andrea Arcangeli <aarcange@redhat.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] kernfs: fix memleak in kernel_ops_readdir()
Message-ID: <20190807184518.GP136335@devbig004.ftw2.facebook.com>
References: <20190805173404.GF136335@devbig004.ftw2.facebook.com>
 <20190807132928.GD5443@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807132928.GD5443@atomide.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

On Wed, Aug 07, 2019 at 06:29:28AM -0700, Tony Lindgren wrote:
> Hi,
> 
> * Tejun Heo <tj@kernel.org> [691231 23:00]:
> > From: Andrea Arcangeli <aarcange@redhat.com>
> > 
> > If getdents64 is killed or hits on segfault, it'll leave cgroups
> > directories in sysfs pinned leaking memory because the kernfs node
> > won't be freed on rmdir and the parent neither.
> 
> Somehow this causes a regression in Linux next for me where I'm seeing
> lots of sysfs entries now missing under /sys/bus/platform/devices.
> 
> For example, I now only see one .serial entry show up in sysfs.
> Things work again if I revert commit cc798c83898e ("kernfs: fix memleak
> inkernel_ops_readdir()"). Any ideas why that would be?
> 
> Below is a diff -u of ls /sys/bus/platform/devices for reference
> showing the missing entries with cc798c83898e.

Ugh, you're right.  It can get double-put cuz ctx->pos is put by
release too.  Greg, sorry about the noise but can you please revert
the patch?  I'll look into why this looked like memory leak from
slabinfo side.

Thanks.

-- 
tejun
