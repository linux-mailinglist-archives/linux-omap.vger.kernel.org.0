Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59803372E68
	for <lists+linux-omap@lfdr.de>; Tue,  4 May 2021 19:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhEDREc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 May 2021 13:04:32 -0400
Received: from sender11-of-o52.zoho.eu ([31.186.226.238]:21606 "EHLO
        sender11-of-o52.zoho.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhEDREb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 May 2021 13:04:31 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 May 2021 13:04:31 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1620146906; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=bpBX6wN19WGkDT8laoe15lIX83EL1WF7B/9TCUgLvcfLy3snHNgNotp1mrDJ0oMcJ9Z/iiMQuaTy0WwfMRmMW3xGgxinKsnawJKNPIL5KYgIOj5CWFc2ZnzmvZljKq73jPLM97vccXXUCeaZAQpSZB/qKW67xBMqEBNVXrKM9ko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1620146906; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=6HVzuaYWbssaWdP9yIlWbd3Cx0QX3Grzq+d1VPGGNGg=; 
        b=AseDlYrDkJCd7CgWle/dGwXWw3Ej1KzH2bSPZ7qz14lLX1Uz4B09nMcNmmTwpgv6MvXl4u4y1MNcBQk0zLVgolppspDMwXLAq0Trhx4Ik/7FgeThzlDYYc+aWWWHxM8a11L1w33k34UvloThM/gXUEa/rULI2K6RbQdGR8pj8js=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=devnull@uvos.xyz;
        dmarc=pass header.from=<devnull@uvos.xyz> header.from=<devnull@uvos.xyz>
Received: from UVOSLinux (ip-95-222-214-7.hsi15.unitymediagroup.de [95.222.214.7]) by mx.zoho.eu
        with SMTPS id 1620146905484352.1578202622519; Tue, 4 May 2021 18:48:25 +0200 (CEST)
Date:   Tue, 4 May 2021 18:48:24 +0200
From:   Dev Null <devnull@uvos.xyz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Mighty M <mightymb17@gmail.com>, linux-omap@vger.kernel.org
Subject: Re: Performance difference in mainline and downstream
Message-Id: <20210504184824.d24a29c4fdb4c807b54f3d33@uvos.xyz>
In-Reply-To: <YJFDHfRc1Q02gh/k@atomide.com>
References: <CACLAQJFHyYESWO0_N8Qin8eY2moswN-eeWi5bHcRWhCJpjsjjg@mail.gmail.com>
        <YI/ONvCE4RuUV6SC@atomide.com>
        <CACLAQJH6tgaSqH=hs-=WEOWmD6ozkkRkL_dm0MBNV5qiPHFveg@mail.gmail.com>
        <YJFDHfRc1Q02gh/k@atomide.com>
Organization: UVOS Organization
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

armv7h in general also has some of the secuity mitigations around
speculative execution / branch prediction.

no clue what the cumulative inpact of these is on omap4 but the vendor
kernel very likely dosent have any

On Tue, 4 May 2021 15:50:37 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Mighty M <mightymb17@gmail.com> [210504 06:02]:
> > Hello, CONFIG_ARCH_OMAP2 is already disabled in my .config and I
> > couldnt find CONFIG_DEBUG.
> 
> Sorry I meant CONFIG_DEBUG_KERNEL :)
> 
> Try first dropping these lines from your .config:
> 
> CONFIG_EXPERT=y
> CONFIG_DEBUG_KERNEL=y
> 
> Regards,
> 
> Tony


-- 
Dev Null <devnull@uvos.xyz>
