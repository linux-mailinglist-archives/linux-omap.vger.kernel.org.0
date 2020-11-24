Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E469E2C324D
	for <lists+linux-omap@lfdr.de>; Tue, 24 Nov 2020 22:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgKXVFQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Nov 2020 16:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbgKXVFP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 24 Nov 2020 16:05:15 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35550C0613D6;
        Tue, 24 Nov 2020 13:05:15 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s8so23710172wrw.10;
        Tue, 24 Nov 2020 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1YhGAyXK8n6pepeYvYtwgBpWdzXPSJrHj4IsMey64hg=;
        b=UeZdTl51xak6P/TMw3T5lS6KBp+eup2WttsiEHBqGcrB5Bbq1feDNVXX0lCqQVKsju
         P9MN5E5K8xmx/2PG0XBjeJcFYKn0Rk/eH+PYznDegPZLLvD0+d00DT4zlyzbkXjGhEST
         e6mNTY84i6D1ic8OYoo00j2Ygn+eBcnerG8LDVK+33fj6fFlBdycPLAvKd3TkRtYC0CW
         M6OyizSGgIPPlkM4tQEKrGF3yKBz0p6CuCuLCKkkPiwf59vNMRgWwkuMNGdNBhXJA0HD
         srl3fAstlt/zgspguRSm0C3ZSpm/Wd6bXqi4m8REP7bJPW/uf4Xd2NClOnDBvWKrQXJv
         OYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1YhGAyXK8n6pepeYvYtwgBpWdzXPSJrHj4IsMey64hg=;
        b=RVTDUF2gzPv5HkLy8TzmK5t2FgXAkDcMmbiDs1YjqEzh/QL56VNTL8PvBrvethvdTs
         Z1mc52TbUKeRbKuOn1sjBBZ6u3FJbmNK48GQWTLHM2g97PRiWxMM4tsKe58HuTdGBk7K
         ZlvXdVom1qGUQ+DRaMMNcW9sqhKSoDZwQPD54+uj2tllRVq7WvX6L6d+2L3OkZi9+Ntg
         ON+UAjB5/WkzElXDgbWZRWbqK+yCMCtk9OVnTC56Vipo+tNTRUnUDR9N7//abrF1DV+A
         vWtKJqF2fptvrWc4HwFBByo06onabYOor84WXU8sSzbwq8JupIjnsDnQp4BYkHyBpBom
         Q+mg==
X-Gm-Message-State: AOAM532/e5R9r48FJfVQ70e4lZM/iFqJnOOEiOCAzkBjWsNgldU4dHjl
        HxziHNO4/EIHWTSobkvCNFqcN46FgsU=
X-Google-Smtp-Source: ABdhPJx1x1i3xswJqCRetOxjNmPdoHsnpHs5HNS6ZfGjM/dUJEoXH+FbCy/7Rww/fxtoadl/lb02qQ==
X-Received: by 2002:adf:f349:: with SMTP id e9mr421186wrp.110.1606251913618;
        Tue, 24 Nov 2020 13:05:13 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id g11sm204083wrq.7.2020.11.24.13.05.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 13:05:12 -0800 (PST)
Subject: Re: [REGRESSION] omapdrm/N900 display broken
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ML dri-devel <dri-devel@lists.freedesktop.org>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200728181412.GA49617@darkstar.musicnaut.iki.fi>
 <660b2fe1-343d-b83e-11d2-5a5eb530b83f@ti.com>
 <448c1441-2cac-44ef-95ef-bb28b512297b@ti.com>
 <20200823162625.GC4313@darkstar.musicnaut.iki.fi>
 <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <5072a25d-e885-cdd2-978d-70942406c272@gmail.com>
Date:   Tue, 24 Nov 2020 23:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ac42f7f9-2ac2-246e-69c1-3d56cea7e59b@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 25.08.20 г. 16:16 ч., Tomi Valkeinen wrote:
> Hi Laurent,
> 
> On 23/08/2020 19:26, Aaro Koskinen wrote:
>> Hi,
>>
>> On Tue, Aug 04, 2020 at 03:39:37PM +0300, Tomi Valkeinen wrote:
>>> On 04/08/2020 15:13, Tomi Valkeinen wrote:
>>
>>>> Can you try to pinpoint a bit where the hang happens? Maybe add
>>>> DRM/omapdrm debug prints, or perhaps sysrq works and it shows a lock
>>>> that's in deadlock.
>>>
>>> Also, one data point would be to disable venc, e.g. set venc status to
>>> "disabled" in dts.
>>
>> Disabling venc makes no difference.
>>
>> The hang happens in drm_fb_helper_initial_config(). I followed the
>> "HANG DEBUGGING" tips in the function comment text and enabled
>> fb.lockless_register_fb=1 to get more (serial) console output.
>>
>> Now I get this:
>>
>> [    6.514739] omapdss_dss 48050000.dss: supply vdda_video not found, using dummy regulator
>> [    6.566375] DSS: OMAP DSS rev 2.0
>> [    6.571807] omapdss_dss 48050000.dss: bound 48050400.dispc (ops dispc_component_ops)
>> [    6.580749] omapdrm omapdrm.0: DMM not available, disable DMM support
>> [    6.587982] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
>> [    6.626617] ------------[ cut here ]------------
>> [    6.631774] WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268
>> [    6.643768] Modules linked in:
>> [    6.647033] CPU: 0 PID: 18 Comm: kworker/0:1 Tainted: G     U            5.8.0-omap3-los_16068+-00004-g2e7d4a7efefd-dirty #2
>> [    6.658966] Hardware name: Nokia RX-51 board
>> [    6.663635] Workqueue: events deferred_probe_work_func
>> [    6.669097] [<c010bf18>] (unwind_backtrace) from [<c010a0f4>] (show_stack+0x10/0x14)
>> [    6.677429] [<c010a0f4>] (show_stack) from [<c0124f18>] (__warn+0xbc/0xd4)
>> [    6.684844] [<c0124f18>] (__warn) from [<c0124f90>] (warn_slowpath_fmt+0x60/0xb8)
>> [    6.692901] [<c0124f90>] (warn_slowpath_fmt) from [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables+0x134/0x268)
>> [    6.704254] [<c040c0e8>] (drm_atomic_helper_commit_modeset_enables) from [<c045442c>] (omap_atomic_commit_tail+0xb4/0xc0)
>> [    6.715972] [<c045442c>] (omap_atomic_commit_tail) from [<c040d1b4>] (commit_tail+0x9c/0x1a8)
>> [    6.725128] [<c040d1b4>] (commit_tail) from [<c040de70>] (drm_atomic_helper_commit+0x134/0x158)
>> [    6.734466] [<c040de70>] (drm_atomic_helper_commit) from [<c043b204>] (drm_client_modeset_commit_atomic+0x16c/0x208)
>> [    6.745727] [<c043b204>] (drm_client_modeset_commit_atomic) from [<c043b2f8>] (drm_client_modeset_commit_locked+0x58/0x184)
>> [    6.757629] [<c043b2f8>] (drm_client_modeset_commit_locked) from [<c043b448>] (drm_client_modeset_commit+0x24/0x40)
>> [    6.768798] [<c043b448>] (drm_client_modeset_commit) from [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0xa0/0xc8)
>> [    6.780975] [<c0412778>] (__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c0412808>] (drm_fb_helper_set_par+0x38/0x64)
>> [    6.792785] [<c0412808>] (drm_fb_helper_set_par) from [<c03a9b24>] (fbcon_init+0x3d4/0x568)
>> [    6.801757] [<c03a9b24>] (fbcon_init) from [<c03eaab0>] (visual_init+0xb8/0xfc)
>> [    6.809631] [<c03eaab0>] (visual_init) from [<c03ec070>] (do_bind_con_driver+0x1e0/0x3bc)
>> [    6.818267] [<c03ec070>] (do_bind_con_driver) from [<c03ec59c>] (do_take_over_console+0x138/0x1d8)
>> [    6.827880] [<c03ec59c>] (do_take_over_console) from [<c03a856c>] (do_fbcon_takeover+0x74/0xd4)
>> [    6.837219] [<c03a856c>] (do_fbcon_takeover) from [<c03a22e0>] (register_framebuffer+0x204/0x2d8)
>> [    6.846740] [<c03a22e0>] (register_framebuffer) from [<c0412228>] (__drm_fb_helper_initial_config_and_unlock+0x3a4/0x554)
>> [    6.858459] [<c0412228>] (__drm_fb_helper_initial_config_and_unlock) from [<c045c230>] (omap_fbdev_init+0x84/0xbc)
>> [    6.869537] [<c045c230>] (omap_fbdev_init) from [<c04549b8>] (pdev_probe+0x580/0x7d8)
>> [    6.877807] [<c04549b8>] (pdev_probe) from [<c04669b4>] (platform_drv_probe+0x48/0x98)
> 
> Laurent, does this ring any bells? The WARN comes in drm_atomic_bridge_chain_enable() when
> drm_atomic_get_old_bridge_state() returns null for (presumably) sdi bridge.
> 
> I'm not sure why the bridge state would not be there.
> 
> Aaro, you can probably debug easier if you disable CONFIG_FRAMEBUFFER_CONSOLE, or even
> CONFIG_DRM_FBDEV_EMULATION.
> 
>   Tomi
> 

Is there any progress on the issue? I tried 5.9.1 and still nothing 
displayed.

Regards,
Ivo
