Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73009C88ED
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 14:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfJBMlX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 08:41:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37061 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfJBMlW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Oct 2019 08:41:22 -0400
Received: by mail-io1-f67.google.com with SMTP id b19so28396187iob.4;
        Wed, 02 Oct 2019 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WRefwbE6VF1W44fHwxCyYGRrTz1BonfmO7vvu80JTHA=;
        b=U/pvykx7ssnIUmelCGQq122oFwGByD8jaKKXblDl+W/xgx2rgx8T/TJlC7hwZrE2/x
         cYMGhFvxMEY5+C258lxoZ8owHWg5h0IUIBcPiEvh0KpP8oY1Wh8egOnmuWbfoG6fjFqk
         arpxrggFxZNORTt1cw5dgADLZbag/Cf8DdPDkyrqItEenAjDwQd1xjvw1G/aB+UWX4yE
         RbpVEjHpQG3NBnrC6whXvNH2b9S0lUpMbearaVOLRokyazjEdkJ8uMSofYZdxSJd2st3
         DFVE824k0avYb/x5ttNaffVSpRJ7GGt/p57ESZhhJoZpDp22xj/el89kFR8zbn5tmJ/j
         EKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WRefwbE6VF1W44fHwxCyYGRrTz1BonfmO7vvu80JTHA=;
        b=KSdw+ipo1hEf5ZoxezwwYE5UwxrbW1VZZWqL/IABG6xjCosRuvvYyWSNHpX7HayNeO
         oiF1Ym3GMf4puIZttgcA1yMfAn6Jl6qWuvtVupqJptkQ8JJjTMlb17oOv+Zx9hy8m2Ps
         mQR2QcwSyOQ3WyCy59zNYQfrKgoPpI3Jp+N295UrS6i/rtM284aXoAwT6i9DJEfn1G/y
         8OGNPbgXp/4dWpT0UpGquYxOHI6JJkvtWeRnZCwwRiBCKTGL3mk3U+P9HsfZ6Usr0Lby
         U4AHcg+AFEExfFlhrhdnkp+tcb1m9k3jfUIH3qEEaU96JcLgIxeSnxBx4Vz3AszlLm6H
         M+9A==
X-Gm-Message-State: APjAAAUqnki4A5SS/kXWDLLR+CRg/GuAyXq68GPzQIWWwJN2Rk911V1Q
        i+VkBTqr7Fk7LaGh7GqWoxxZIj3CPg9qaRM5fNY=
X-Google-Smtp-Source: APXvYqybDiC7EETNsAAXhJdYVGktlkLkfGVeBZjepH1xMCQI/2K5PEFIoY6u05md/biK0JudFRi0kdrdhDKnYhQrJIQ=
X-Received: by 2002:a6b:b213:: with SMTP id b19mr2929813iof.58.1570020080446;
 Wed, 02 Oct 2019 05:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20191002120611.26121-1-t-kristo@ti.com> <20191002120611.26121-2-t-kristo@ti.com>
In-Reply-To: <20191002120611.26121-2-t-kristo@ti.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 2 Oct 2019 07:41:08 -0500
Message-ID: <CAHCN7xJCZ6S_KjFwPG21PjgT+OZUf+60McikhZNL8JMHMrcM5g@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: ti: divider: cleanup _register_divider and ti_clk_get_div_table
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 2, 2019 at 7:06 AM Tero Kristo <t-kristo@ti.com> wrote:
>
> Cleanup couple of TI divider clock internal APIs. These currently pass
> huge amount of parameters, which makes it difficult to track what is
> going on. Abstract most of these under struct clk_omap_div which gets
> passed over the APIs.
>
For the series:
This fixes a hanging issue on a DM3730 with a 480x272 screen where the
pixel clock is set to 9MHz and the clock divider attempts to calculate
a fclk and hangs.  I have always had to hack the divider to prevent
the hang.
If possible, it would be nice to have this applied to 5.4 branch since
it will be an LTS kernel.

Tested-by: Adam Ford <aford173@gmail.com>

> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/clk/ti/divider.c | 113 ++++++++++++++-------------------------
>  1 file changed, 41 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
> index 6cb863c13648..1b181f89ddc6 100644
> --- a/drivers/clk/ti/divider.c
> +++ b/drivers/clk/ti/divider.c
> @@ -310,47 +310,26 @@ const struct clk_ops ti_clk_divider_ops = {
>         .restore_context = clk_divider_restore_context,
>  };
>
> -static struct clk *_register_divider(struct device *dev, const char *name,
> -                                    const char *parent_name,
> -                                    unsigned long flags,
> -                                    struct clk_omap_reg *reg,
> -                                    u8 shift, u8 width, s8 latch,
> -                                    u8 clk_divider_flags,
> -                                    const struct clk_div_table *table)
> +static struct clk *_register_divider(struct device_node *node,
> +                                    u32 flags,
> +                                    struct clk_omap_divider *div)
>  {
> -       struct clk_omap_divider *div;
>         struct clk *clk;
>         struct clk_init_data init;
> +       const char *parent_name;
>
> -       if (clk_divider_flags & CLK_DIVIDER_HIWORD_MASK) {
> -               if (width + shift > 16) {
> -                       pr_warn("divider value exceeds LOWORD field\n");
> -                       return ERR_PTR(-EINVAL);
> -               }
> -       }
> -
> -       /* allocate the divider */
> -       div = kzalloc(sizeof(*div), GFP_KERNEL);
> -       if (!div)
> -               return ERR_PTR(-ENOMEM);
> +       parent_name = of_clk_get_parent_name(node, 0);
>
> -       init.name = name;
> +       init.name = node->name;
>         init.ops = &ti_clk_divider_ops;
>         init.flags = flags;
>         init.parent_names = (parent_name ? &parent_name : NULL);
>         init.num_parents = (parent_name ? 1 : 0);
>
> -       /* struct clk_divider assignments */
> -       memcpy(&div->reg, reg, sizeof(*reg));
> -       div->shift = shift;
> -       div->width = width;
> -       div->latch = latch;
> -       div->flags = clk_divider_flags;
>         div->hw.init = &init;
> -       div->table = table;
>
>         /* register the clock */
> -       clk = ti_clk_register(dev, &div->hw, name);
> +       clk = ti_clk_register(NULL, &div->hw, node->name);
>
>         if (IS_ERR(clk))
>                 kfree(div);
> @@ -425,8 +404,8 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
>         return 0;
>  }
>
> -static struct clk_div_table *
> -__init ti_clk_get_div_table(struct device_node *node)
> +static int __init ti_clk_get_div_table(struct device_node *node,
> +                                      struct clk_omap_divider *div)
>  {
>         struct clk_div_table *table;
>         const __be32 *divspec;
> @@ -438,7 +417,7 @@ __init ti_clk_get_div_table(struct device_node *node)
>         divspec = of_get_property(node, "ti,dividers", &num_div);
>
>         if (!divspec)
> -               return NULL;
> +               return 0;
>
>         num_div /= 4;
>
> @@ -453,13 +432,12 @@ __init ti_clk_get_div_table(struct device_node *node)
>
>         if (!valid_div) {
>                 pr_err("no valid dividers for %pOFn table\n", node);
> -               return ERR_PTR(-EINVAL);
> +               return -EINVAL;
>         }
>
>         table = kcalloc(valid_div + 1, sizeof(*table), GFP_KERNEL);
> -
>         if (!table)
> -               return ERR_PTR(-ENOMEM);
> +               return -ENOMEM;
>
>         valid_div = 0;
>
> @@ -472,7 +450,9 @@ __init ti_clk_get_div_table(struct device_node *node)
>                 }
>         }
>
> -       return table;
> +       div->table = table;
> +
> +       return 0;
>  }
>
>  static int _get_divider_width(struct device_node *node,
> @@ -520,46 +500,43 @@ static int _get_divider_width(struct device_node *node,
>  }
>
>  static int __init ti_clk_divider_populate(struct device_node *node,
> -       struct clk_omap_reg *reg, const struct clk_div_table **table,
> -       u32 *flags, u8 *div_flags, u8 *width, u8 *shift, s8 *latch)
> +                                         struct clk_omap_divider *div,
> +                                         u32 *flags)
>  {
>         u32 val;
>         int ret;
>
> -       ret = ti_clk_get_reg_addr(node, 0, reg);
> +       ret = ti_clk_get_reg_addr(node, 0, &div->reg);
>         if (ret)
>                 return ret;
>
>         if (!of_property_read_u32(node, "ti,bit-shift", &val))
> -               *shift = val;
> +               div->shift = val;
>         else
> -               *shift = 0;
> +               div->shift = 0;
>
> -       if (latch) {
> -               if (!of_property_read_u32(node, "ti,latch-bit", &val))
> -                       *latch = val;
> -               else
> -                       *latch = -EINVAL;
> -       }
> +       if (!of_property_read_u32(node, "ti,latch-bit", &val))
> +               div->latch = val;
> +       else
> +               div->latch = -EINVAL;
>
>         *flags = 0;
> -       *div_flags = 0;
> +       div->flags = 0;
>
>         if (of_property_read_bool(node, "ti,index-starts-at-one"))
> -               *div_flags |= CLK_DIVIDER_ONE_BASED;
> +               div->flags |= CLK_DIVIDER_ONE_BASED;
>
>         if (of_property_read_bool(node, "ti,index-power-of-two"))
> -               *div_flags |= CLK_DIVIDER_POWER_OF_TWO;
> +               div->flags |= CLK_DIVIDER_POWER_OF_TWO;
>
>         if (of_property_read_bool(node, "ti,set-rate-parent"))
>                 *flags |= CLK_SET_RATE_PARENT;
>
> -       *table = ti_clk_get_div_table(node);
> -
> -       if (IS_ERR(*table))
> -               return PTR_ERR(*table);
> +       ret = ti_clk_get_div_table(node, div);
> +       if (ret)
> +               return ret;
>
> -       *width = _get_divider_width(node, *table, *div_flags);
> +       div->width = _get_divider_width(node, div->table, div->flags);
>
>         return 0;
>  }
> @@ -573,24 +550,17 @@ static int __init ti_clk_divider_populate(struct device_node *node,
>  static void __init of_ti_divider_clk_setup(struct device_node *node)
>  {
>         struct clk *clk;
> -       const char *parent_name;
> -       struct clk_omap_reg reg;
> -       u8 clk_divider_flags = 0;
> -       u8 width = 0;
> -       u8 shift = 0;
> -       s8 latch = -EINVAL;
> -       const struct clk_div_table *table = NULL;
>         u32 flags = 0;
> +       struct clk_omap_divider *div;
>
> -       parent_name = of_clk_get_parent_name(node, 0);
> +       div = kzalloc(sizeof(*div), GFP_KERNEL);
> +       if (!div)
> +               return;
>
> -       if (ti_clk_divider_populate(node, &reg, &table, &flags,
> -                                   &clk_divider_flags, &width, &shift, &latch))
> +       if (ti_clk_divider_populate(node, div, &flags))
>                 goto cleanup;
>
> -       clk = _register_divider(NULL, node->name, parent_name, flags, &reg,
> -                               shift, width, latch, clk_divider_flags, table);
> -
> +       clk = _register_divider(node, flags, div);
>         if (!IS_ERR(clk)) {
>                 of_clk_add_provider(node, of_clk_src_simple_get, clk);
>                 of_ti_clk_autoidle_setup(node);
> @@ -598,22 +568,21 @@ static void __init of_ti_divider_clk_setup(struct device_node *node)
>         }
>
>  cleanup:
> -       kfree(table);
> +       kfree(div->table);
> +       kfree(div);
>  }
>  CLK_OF_DECLARE(divider_clk, "ti,divider-clock", of_ti_divider_clk_setup);
>
>  static void __init of_ti_composite_divider_clk_setup(struct device_node *node)
>  {
>         struct clk_omap_divider *div;
> -       u32 val;
> +       u32 tmp;
>
>         div = kzalloc(sizeof(*div), GFP_KERNEL);
>         if (!div)
>                 return;
>
> -       if (ti_clk_divider_populate(node, &div->reg, &div->table, &val,
> -                                   &div->flags, &div->width, &div->shift,
> -                                   NULL) < 0)
> +       if (ti_clk_divider_populate(node, div, &tmp))
>                 goto cleanup;
>
>         if (!ti_clk_add_component(node, &div->hw, CLK_COMPONENT_TYPE_DIVIDER))
> --
> 2.17.1
>
> --
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
