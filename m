Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F01A917C5DF
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 20:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgCFTEi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 14:04:38 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40499 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgCFTEi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Mar 2020 14:04:38 -0500
Received: by mail-pl1-f194.google.com with SMTP id y1so1237983plp.7;
        Fri, 06 Mar 2020 11:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1GUkIsUTuSnSSpLKUvBgyNN8CfsNZI8PRzymSo36qJw=;
        b=ZpBgw02kWa2UAXEvL+BgeVc9+HXgn9FLp7eVNibTuuvMybHkQQ6CEpOVEfKVQH0gr9
         gGprsnShnLz3FFOKRxtbI4M4k4MmrKEUfI4pMFy5D284JVCmO6tYVBhp8el/BQXT+UzR
         U0rg3KBUyvb6Km4PPiYfWftWh26o+JKJCOFyzhicXBMI24fNPuHtmy/w0pG2H99RcM9C
         EwuHQwX+sb0AmGWKZjTLKE7OVYvaaO56lsjt4t68AXGACwG6VWPV8r1SicapVBhwGI9R
         K5uzKNUA0f1SSlKUkThdkUmPuAplBb0kRfnLjiLFq5G4vbsCMPnsFnpg5eZKdFOcLcLd
         /KSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1GUkIsUTuSnSSpLKUvBgyNN8CfsNZI8PRzymSo36qJw=;
        b=RZkqZxzDIgcAckAiNNcdgaeHUbCJ78ZSBl/Sgk6FNdsNnwg//4auKVczoYdQ/aWJWO
         uFlJFLnt8tFQBePVsbpLVVNcV70D/bxJP3VAqPE8OUa3pFXvtFcHOqLU6Ozi79iUKdjr
         A5dJHUnf3sH+/0XiC1Ewab/DRlLCC2A4Twnv7O81Ka1zLAwZNUv85qBLKckcrBrkJBAJ
         5O8erLzlT4ENRV/Fn6FH8t/+AjvNGWu9IEFM8+SOAkdDoLB4s5GotEKXzi3Z8a+pxkMK
         kqDB/GbylWAjYHRBNXJBeUtASMSNDOqB8f1m8xo5l8ytRCQ+b3Lt4WUdE31N/KuFDfDD
         Wa3g==
X-Gm-Message-State: ANhLgQ1awFioirI6WBQj5WbBPsqx2zmvT2hwBJzDY9yxGtEHYYgOIOMo
        Fj4pKl3bQTYiWm9VxV/OIjD7u306
X-Google-Smtp-Source: ADFU+vtkAWegW6fo292noeREOHfe6RpcG+x3ccdha0rJSJgq3DHjbKQnuFpEAVbcsajb6NEmT9/oew==
X-Received: by 2002:a17:902:ab8f:: with SMTP id f15mr4446486plr.280.1583521476963;
        Fri, 06 Mar 2020 11:04:36 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id l1sm10283831pjb.15.2020.03.06.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 11:04:36 -0800 (PST)
Date:   Fri, 6 Mar 2020 11:04:33 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCHv2 4/3] Input: omap4-keypad - scan the keys in two phases
 to detect lost key-up
Message-ID: <20200306190433.GG217608@dtor-ws>
References: <20200228171223.11444-1-tony@atomide.com>
 <20200228180243.GM37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228180243.GM37466@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 28, 2020 at 10:02:43AM -0800, Tony Lindgren wrote:
> In addition to handling errata i689 for idle with state, we must also
> check for lost key up interrupts on fast key presses.
> 
> For example rapidly pressing shift-shift-j can sometimes produce a J
> instead of j. Let's fix the issue by scanning the keyboard in two
> phases. First we scan for any key up events that we may have missed,
> and then we scan for key down events.
> 
> Cc: Arthur Demchenkov <spinal.by@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c | 48 ++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -109,6 +109,34 @@ static void kbd_write_irqreg(struct omap4_keypad *keypad_data,
>  		     keypad_data->base + keypad_data->irqreg_offset + offset);
>  }
>  
> +static void omap4_keypad_scan_state(struct omap4_keypad *keypad_data,
> +				    unsigned char *key_state,
> +				    bool down)
> +{
> +	struct input_dev *input_dev = keypad_data->input;
> +	unsigned int col, row, code, changed;
> +	bool key_down;
> +
> +	for (row = 0; row < keypad_data->rows; row++) {
> +		changed = key_state[row] ^ keypad_data->key_state[row];
> +		if (!changed)
> +			continue;
> +
> +		for (col = 0; col < keypad_data->cols; col++) {
> +			if (changed & (1 << col)) {


Looking at all too this, key state is 64 bit value, so if we make it a
bitmap and use "for_each_set_bit()" we can simplify this scanning code.

Thanks.

-- 
Dmitry
