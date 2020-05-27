Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736271E5114
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 00:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgE0WTV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 May 2020 18:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgE0WTU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 May 2020 18:19:20 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B6AC05BD1E
        for <linux-omap@vger.kernel.org>; Wed, 27 May 2020 15:19:20 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gl26so1559935ejb.11
        for <linux-omap@vger.kernel.org>; Wed, 27 May 2020 15:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KBGl8NKT0kd0Rvi0lST9Qnz0ay6CS/h9n7E5FIFLlNY=;
        b=IAIBlzh5u/DZMRQBJp7ch0Vg4m5ZwXs3meEUQmSwlByaiSK2xNCCLW4T5qHIeSRDm4
         T/Llqx2R4rhuq3JPIkZyXVZWY4p64shjZbZ/AozOzXimPI+kbSAqjxTuWs/qt+KuM3cB
         tWwB3MeyH0aAgPnDRKBGmxoK6uIKDANcj+RcRcXTKWeHpoh0NDC7Q6z/GnkB7gP9kJqz
         va4JTzZu5TaZLjAYia7GVXqFTzjPKd0FtIbo4TzYDlBFVNSWMFOkB6w4eeIFD3PUfkWV
         LZW+T3zqq2AD0cf2OmGUVZ+V0e+9StwZIYftAAGR32/p5EtDVBV6nZUvE5the3pV+ZGQ
         rdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KBGl8NKT0kd0Rvi0lST9Qnz0ay6CS/h9n7E5FIFLlNY=;
        b=JgGakry5QDC43vAZOmn6LzE4+76McstHbfVO3v0gBxOqkqUfZdQOmbB7dwjo1Ew+IG
         qQlYBLZ4dCdbV93oxf1m7IvLhB4VhR7GsN3NQvn2LyA0as9NdFQnKtksZhxih8x7eaI0
         LfhuVD8c9NF/JTSs4qcWmrlSPzsGmhVau6WUXKyuSH9/04dslJMQz5cCAq++I19BKE3u
         quwyiDV4evPXkBp7CSK1OVG+iQvDw0pEP8fiwwev6W8IhF7EijH128yz9f2AqJeWOtAn
         /uXZuu0FpG19x3S6GQzQPdcQ2mdXhOsurtcGhNijZysSr3WiFvLAV2iE3CzNBi29fJAK
         P1qA==
X-Gm-Message-State: AOAM532HIj6zW7cjWyk0WKzfhNPrtIrmaMXlyOT2kfFSYiDW4kVf7okG
        ERZ3WP4MN+c4iofb6QvAVPvH81Wv8Go+rg==
X-Google-Smtp-Source: ABdhPJxcNJjGZdoGBlL2xdgcvg+/LXnd80LkBNikangzcbGu4GxPVdhCTHeYQAvyJRzkaYE1abRrsg==
X-Received: by 2002:a17:906:cd06:: with SMTP id oz6mr453610ejb.434.1590617958744;
        Wed, 27 May 2020 15:19:18 -0700 (PDT)
Received: from x1 ([2001:16b8:5c2b:d601:98fe:8f8:cce1:59e])
        by smtp.gmail.com with ESMTPSA id o18sm3760239eje.40.2020.05.27.15.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 15:19:17 -0700 (PDT)
Date:   Thu, 28 May 2020 00:19:15 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org
Subject: Re: pinctrl-single: num_maps in generic pinconf support?
Message-ID: <20200527221915.GA2963339@x1>
References: <20200526122133.GA1454440@x1>
 <20200527165122.GL37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527165122.GL37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 27, 2020 at 09:51:22AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200526 12:22]:
> > Hello Haojian and Linus,
> > 
> > For pcs_parse_one_pinctrl_entry() in drivers/pinctrl/pinctrl-single.c,
> > I see that num_maps is set to 2 if PCS_HAS_PINCONF is enabled:
> > 
> > 1057         if (PCS_HAS_PINCONF && function) {
> > 1058                 res = pcs_parse_pinconf(pcs, np, function, map);
> > 1059                 if (res)
> > 1060                         goto free_pingroups;
> > 1061                 *num_maps = 2;
> > 1062         } else {
> > 1063                 *num_maps = 1;
> > 1064         }
> > 1065         mutex_unlock(&pcs->mutex);
> > 
> > git blame shows me that came from 9dddb4df90d13:
> > "pinctrl: single: support generic pinconf"
> > 
> > Would you be able to provide any insight as to num_maps needs to be 2
> > when pinconf is enabled?
> 
> Only slightly related, but we should really eventually move omaps to use
> #pinctrl-cells = <2> (or 3) instead of 1, and pass the pinconf seprately
> from the mux mode. 

Thanks for the insight, Tony.

I was not considering the situation where pinctrl-cells would be more
than 1.

I see now from pinctrl-single.txt bindings doc that:

- #pinctrl-cells : number of cells in addition to the index, set to 1
  for pinctrl-single,pins and 2 for pinctrl-single,bits

I am now wondering if it wrong for me to expect compatible string of 
"pinconf-single" to work with pinctrl-cells of 1.

I see that arch/arm/boot/dts/da850.dtsi has:

154                 pmx_core: pinmux@14120 {
155                         compatible = "pinctrl-single";
156                         reg = <0x14120 0x50>;
157                         #pinctrl-cells = <2>;
158                         pinctrl-single,bit-per-mux;

and arch/arm/boot/dts/keystone-k2l.dtsi has:

108                 k2l_pmx: pinmux@2620690 {
109                         compatible = "pinctrl-single";
110                         reg = <0x02620690 0xc>;
111                         #address-cells = <1>;
112                         #size-cells = <0>;
113                         #pinctrl-cells = <2>;
114                         pinctrl-single,bit-per-mux;

> We already treat them separately with the new
> AM33XX_PADCONF macro, so we'd only have to change one SoC at a time to
> use updated #pinctrl-cells. But I think pinctrl-single might need some
> changes before we can do that.

Do you mean that it would be possible to make the change just for AM335x
to start with?

Do you think the changes would be limited to pinctrl-single.c and the
associated device tree files like am33xx-l4.dtsi ?


thanks,
drew

