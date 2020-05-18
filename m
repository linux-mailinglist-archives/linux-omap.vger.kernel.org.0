Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C5A1D7AD7
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 16:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgEROQh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 10:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbgEROQh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 10:16:37 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95CAC061A0C
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 07:16:36 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y198so3413798pfb.4
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 07:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VvdwlrTxZSPLNiHSo5izLe2b9V9iAwxZ6AVughxgK60=;
        b=ps2MNAPgt0wJEpSoRGPmK2+4ULpB4BaAo59cnpT7mYucm95vV+gxN5DooIqEcTNchQ
         ze8j0HVaJlTP5iKz7Udv7v1ZseorbSU3Yjf8J1TncdIRulZda1rNqjBIbFvuzd0B5XKC
         +NkmnPUNxVKQTuKkwj0YS9LDDXkK1MhCGK7DclzUYsEvQUBMOzuQ8fkJmCsxteqUW72R
         HngYxY/xbueyPxLiaTl260tRajNXNgLu90K2Z01SShdQZx5HVGuaGO+MEx/oGk06q5jT
         nzf1TdkcPyvjpA0iqS1add5KgxgcklcuYWEHCDch9ud9p2nixqIeu6nuy0osH2SBTyFl
         Ztfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VvdwlrTxZSPLNiHSo5izLe2b9V9iAwxZ6AVughxgK60=;
        b=mLRZ+edUQ575+XUiNTFvhBYS2+Im6fvn5acnfnRrdUITRsNJDmegKGVHc0zafAxBL/
         yboN3IXj3o4/06z+n2hFROv70grlsAXnjIakQpAzj3s1dyRq2S0eU1Bsnicw+GFUxEC3
         zKR3qHNxTqdWWIkLUh9VsrOEHEeIdxwEQ9SwOXarnMcxI+AgSm4WRQHc0mw5t/eatFzJ
         QDxZRqqWb8jySWyDMFiNL9aipYo+yxuTEW8GkVT7+/QB6BaVHsch5oMf8NiYStjE6aH3
         JMMDeuGuioh2lbFZsJJ0GjTA+VjrT+rgEyAe7SUM1namWRqGeXK+wVWMYffVi0b1D35d
         gnoQ==
X-Gm-Message-State: AOAM531PQR/v7TfqMOrvMyfPxFZmi4WXV4NI4JPfbnKvbzBDtmKHvDzf
        lJRtbmes68gd9eZHVrWbvt4N2PwOrUcv0jmqiFjsig==
X-Google-Smtp-Source: ABdhPJx3wRh01nd1bZ/9vwQRe0znfW0aKGrrl0hY0MSDSxHkHDrF5FbNPirncmGpWohW35cZQJhy5r+VW/7ncV+Hj3Q=
X-Received: by 2002:a63:2bd3:: with SMTP id r202mr15015983pgr.130.1589811396267;
 Mon, 18 May 2020 07:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200518033319.GC24805@intel.com>
In-Reply-To: <20200518033319.GC24805@intel.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 18 May 2020 16:16:25 +0200
Message-ID: <CAAeHK+wLp6h9Ew5ZHgk7u3qQ7gN32ZPqdWUcYcFNYfzFw5EvVQ@mail.gmail.com>
Subject: Re: [balbi-usb:testing/fixes 2/8] WARNING: simple_strtoul is
 obsolete, use kstrtoul instead
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, USB list <linux-usb@vger.kernel.org>,
        linux-omap@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, May 18, 2020 at 5:34 AM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/fixes
> head:   172b14b48ca10b280482b164506892ea09edb946
> commit: 97df5e5758f7d1dd0ca97e3210696818fc45bdb3 [2/8] usb: raw-gadget: fix gadget endpoint selection
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> scripts/checkpatch.pl 0001-usb-raw-gadget-fix-gadget-endpoint-selection.patch
> # many are suggestions rather than must-fix
>
> WARNING: simple_strtoul is obsolete, use kstrtoul instead
> #123: drivers/usb/gadget/legacy/raw_gadget.c:261:
> +               return simple_strtoul(&name[2], NULL, 10);

The use of simple_strtoul() is intended here and falls under [1]. I'm
not sure if we need to explain this to kbuild test robot somehow.

[1] https://elixir.bootlin.com/linux/v5.7-rc5/source/include/linux/kernel.h#L459
