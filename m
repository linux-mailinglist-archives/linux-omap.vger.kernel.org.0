Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50B2786C8F
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2019 23:43:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390454AbfHHVnD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Aug 2019 17:43:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42903 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733295AbfHHVnC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Aug 2019 17:43:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so44811088pff.9;
        Thu, 08 Aug 2019 14:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1bNgei30R6lkF3hz+NsVCnBAfvYU1eRUdoqwp3463t0=;
        b=PysEoIwt1QJUUowEDG3pVbNXkkflSPVaaCMFeBIrhGNvwPHuXwGT/TPYdysEaTJI3b
         UV1nmlhyB52On3hIZeqIP71Pys6yrENCPU5q2zZKsebz16UcrAWC2W1kCIBJ6liUp/kq
         r0xvqRlxjLLMakLhHlTzi1Y9xGICGoA1xer3kNcciftJR+6M+6jlc8WkEWm0zJZRv/5i
         vS7VQaEBefSYc5Ru6fSuinXx9Q8JEw8XQq8VSyvcrVVkK2K/Urjh3ZSN2teV7rxf39XB
         2n9xCZ97baGKPApYifT0fumuWGrozzknixJosH5u4UELLWRedE+lC2KljjtJVNTSUDbN
         LQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1bNgei30R6lkF3hz+NsVCnBAfvYU1eRUdoqwp3463t0=;
        b=bCg00S9L9WotvyPmNtM1E1dQYU9eYUBS7hnkNBQg2w98XUjsL9kC0f8OfduFVK9hZ9
         rWPx2ti5THuRhuSd6tZxiKMBjPvCls1tzI7hxfeylhbUDXCnXpID9hG5YUgUsbfyb2nF
         eM2/K3EifLcTY5gaI7WKutu2nRgPU7h/ttHuYW4Um9ogirgefnnsgdaxR/Rl/kZYV6xe
         h5jAC33WL9IcLvOrGMf87gdySU6aMXsu97B8YhE4vngacfyneRXshZKa170UPAoLzXns
         V/yV17Xf5VcrIRcbGgXXLsieyXE15a7ZKHFFObBt794Xov/U195tPjxL3JEjqyOnCfWL
         G2XA==
X-Gm-Message-State: APjAAAWoHJuH8tobvQCqkoNsTf0l2BAm8n3ey6s4c+49L5WopvOo4Ral
        WNsMgaXmmyFc4sysCPHNIxw=
X-Google-Smtp-Source: APXvYqwEYgsfXg+hfoqo9RDdSe7+E36ffIyFkz/VT7eIvM9O8msVvBj84QMApyZWdQt9WCiZrKVPCw==
X-Received: by 2002:a63:e306:: with SMTP id f6mr14301648pgh.39.1565300580917;
        Thu, 08 Aug 2019 14:43:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id ev3sm16522616pjb.3.2019.08.08.14.42.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 14:42:59 -0700 (PDT)
Date:   Thu, 8 Aug 2019 14:42:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/22] input: omap: void using mach/*.h headers
Message-ID: <20190808214257.GF178933@dtor-ws>
References: <20190808212234.2213262-1-arnd@arndb.de>
 <20190808212234.2213262-14-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808212234.2213262-14-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Arnd,

On Thu, Aug 08, 2019 at 11:22:22PM +0200, Arnd Bergmann wrote:
> By using the new linux/soc/ti/omap1-io.h header instead,
> compile-testing can be enabled, and a CONFIG_ARCH_MULTIPLATFORM
> conversion of omap1 may eventually be possible.
> 
> The warning in the header file gets removed in order to
> allow CONFIG_COMPILE_TEST.

Given that we want to migrate people off this driver everywhere but
OMAP1 I wonder why we would want to improve compile coverage of it.

Thanks.

-- 
Dmitry
