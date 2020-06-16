Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB931FBC26
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 18:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730117AbgFPQxV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 12:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728861AbgFPQxT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jun 2020 12:53:19 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D72C061573
        for <linux-omap@vger.kernel.org>; Tue, 16 Jun 2020 09:53:18 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id mb16so22299102ejb.4
        for <linux-omap@vger.kernel.org>; Tue, 16 Jun 2020 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tmG3LnbRJSg3fKU+VOok+qLig2JtTOzSavXoxpBHQG0=;
        b=YkgrjD+WxvLdy4risEIP5GnN/TJKndB19nXRYpItZ3rmCN7L6zoMFdKzbK2hHeVJRr
         zmGk4jdsuXkjPdNxNQfGDNuxu22r42sSvmioy8gTUMg72po1qC/1w+pZX31gz0tpDBIh
         anOTecQEc3CqLp6uqzLZNF4odePAuFYEbtMJ7YJS933NmgucODOB43rgNcZN+lJTTHz8
         Yz7Et++MZD16Fn1TklqPRl+r7ctjpZ/aps/bpq3uOOdqJMnybzUbgUOwImrfFQbVxyd0
         ZOW01uuXtOJ15pq5Ii3yM8M/j6VqoMt4q9HZj/fjy3IePTR6nKm+Ens0Rg3HtLjRTVed
         7apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tmG3LnbRJSg3fKU+VOok+qLig2JtTOzSavXoxpBHQG0=;
        b=fmSxwYuW0Mum31GMPtuFSnPfJdqTJO8UmqPMq77FyMDxFZtS7GU8tLIehO05bpADFm
         JOrLhh1TxOiWlFTBgAPFrS81YeofSsXKUrEURfbIxVm+jOLBjPqvMy/JShERDjSxDP2E
         AjxdFz2d0E3Wi4LlsqhNWWj2xD7zGEZxI3HRS35e7uAz8Lz9+cGbA/2+sOj59DxcXl+r
         sr/rh8O7NpGMV9xcvOTj3yaUf3JMUoSBlkcrJSM/BQCuwmfZDTJfyYKXGw301oGrYz+/
         KSbHCK8m271sObZC8vDhlD7XGLFvXCiVcGJ8Xe01KIfRd6xDlVE9Q9ukemBhb+E9w+SQ
         DDBQ==
X-Gm-Message-State: AOAM532+7y6dt4+MXc2ig5VBIKmnnW22+JXc5Vd+lW++uJurPRBoBtKJ
        3zkQ8ZsbvvgqYnAjAtoAiEphTA==
X-Google-Smtp-Source: ABdhPJzu8fLCRgJ2ALaSxSC5pDD2AYOVPWho8q0Q9tYxmtMORvUO7pZS/LpXl2T9nN/klY+EyircrA==
X-Received: by 2002:a17:906:af62:: with SMTP id os2mr3590836ejb.345.1592326397031;
        Tue, 16 Jun 2020 09:53:17 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id l2sm10373977edq.9.2020.06.16.09.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 09:53:16 -0700 (PDT)
Date:   Tue, 16 Jun 2020 18:53:14 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-omap@vger.kernel.org,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [RFC PATCH] pinctrl-single: parse #pinctrl-cells = 2
Message-ID: <20200616165314.GC4007093@x1>
References: <20200615230906.GA3967771@x1>
 <20200616142628.GX37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616142628.GX37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 16, 2020 at 07:26:28AM -0700, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200615 23:10]:
> > These changes are based on feedback from Tony [1] concerning changing
> > pinctrl-single to be able to handle pinctrl-cells = 2 for for the 
> > "pinctrl-single,pins" property.
> 
> Hey this is great! Thanks for sorting it out.
> 
> > --- a/drivers/pinctrl/pinctrl-single.c
> > +++ b/drivers/pinctrl/pinctrl-single.c
> > @@ -1017,11 +1017,21 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
> >  			break;
> >  		}
> >  
> > -		/* Index plus one value cell */
> >  		offset = pinctrl_spec.args[0];
> >  		vals[found].reg = pcs->base + offset;
> > -		vals[found].val = pinctrl_spec.args[1];
> >  
> > +		pr_info("%s: args_count=%d offset=0x%x", __func__,
> > +				pinctrl_spec.args_count, offset);
> > +		pr_info("%s: args[1]=0x%x", __func__, pinctrl_spec.args[1]);
> > +
> > +		if (pinctrl_spec.args_count == 2) {
> > +			vals[found].val = pinctrl_spec.args[1];
> > +		} else if (pinctrl_spec.args_count == 3) {
> > +			pr_info("%s: args[2]=0x%x", __func__, pinctrl_spec.args[2]);
> > +			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
> > +		}
> 
> Maybe do the above with a switch? And leave out the pr_info for the
> final version :) Also please do a separate patch for pinctrl-singl.c,
> and then another patch for the define and dts change.

Thanks for the suggestions.  Yes, I wasn't sure what the best way to
express this "rough draft" solution.  I'll create a patch series in
future.

> Hmm so now the conf and mux values are still register masks in the dts
> which is not ideal in all cases. But that's a separate issue and could
> be sorted out as needed later on with adding separate conf and mux
> shifts and masks. Not sure if we want to do that for the existing use
> cases though.
> 
> Regards,
> 
> Tony

By register masks, do you mean the #define's like PIN_OUTPUT_PULLDOWN
and MUX_MODE6?

AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE6)

There is a possibility to also use the pinconf properties defined in
pinctrl-single.c:

	static const struct pcs_conf_type prop2[] = {
		{ "pinctrl-single,drive-strength", PIN_CONFIG_DRIVE_STRENGTH, },
		{ "pinctrl-single,slew-rate", PIN_CONFIG_SLEW_RATE, },
		{ "pinctrl-single,input-schmitt", PIN_CONFIG_INPUT_SCHMITT, },
		{ "pinctrl-single,low-power-mode", PIN_CONFIG_LOW_POWER_MODE, },
	};
	static const struct pcs_conf_type prop4[] = {
		{ "pinctrl-single,bias-pullup", PIN_CONFIG_BIAS_PULL_UP, },
		{ "pinctrl-single,bias-pulldown", PIN_CONFIG_BIAS_PULL_DOWN, },
		{ "pinctrl-single,input-schmitt-enable",
			PIN_CONFIG_INPUT_SCHMITT_ENABLE, },
	};

For example, I was experimenting with how to define the bias properties:

        ehrpwm0_pins: pinmux-ehrpwm0-pins {
                pinctrl-single,pins = <
                        AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE1)
                        /* (A13) mcasp0_aclkx.ehrpwm0A */
                >;
                pinctrl-single,bias-pullup = <24 24 0 24>;
        };

        ehrpwm1_pins: pinmux-ehrpwm1-pins {
                pinctrl-single,pins = <
                        AM33XX_PADCONF(AM335X_PIN_GPMC_A2, PIN_OUTPUT_PULLDOWN, MUX_MODE6)
                        /* (U14) gpmc_a2.ehrpwm1A */
                >;
                pinctrl-single,bias-pulldown = <8 8 0 24>;
        };

I found the binding documentation [0] for the bias properties to be very
confusing as to how those 4 values work:

> - pinctrl-single,bias-pullup : array of value that are used to configure the
>   input bias pullup in the pinmux register.
>
> 		/* input, enabled pullup bits, disabled pullup bits, mask */
> 		pinctrl-single,bias-pullup = <0 1 0 1>;
> 
> - pinctrl-single,bias-pulldown : array of value that are used to configure the
>   input bias pulldown in the pinmux register.

>		/* input, enabled pulldown bits, disabled pulldown bits, mask */
>		pinctrl-single,bias-pulldown = <2 2 0 2>;

For AM3358, the pin conf
register has the format [1]:

bit	attribute      value
  6	slew           { 0: fast, 1: slow }
  5     rx_active      { 0: rx disable, 1: rx enabled }
  4     pu_typesel     { 0: pulldown select, 1: pullup select }
  3     puden          { 0: pud enable, 1: disabled }
  2     mode           3 bits to selec mode 0 to 7
  1     mode
  0     mode

And I figured out the values for the bias-pull{up,down} properties:

        16      8       4       2       1
        2^4     2^3     2^2     2^1     2^0
mask    1       1       0       0       0       24
pull-up 1       1       0       0       0       24
pull-dn 0       1       0       0       0       8
none    0       0       0       0       0       0


I did some testing with pr_info's sprinkled in and I think those values
are correct but I would be happy to hear from someone with more insight
in the design of bias-pulldown and bias-pullup.

thanks,
drew

[0] Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
[1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf (see Figure 9-51)
